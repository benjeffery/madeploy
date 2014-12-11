class window.MineMap
  constructor: (@el, @seed, @features) ->
    @map = L.map(@el.get(0), {crs: L.CRS.Simple, maxZoom: 18, minZoom: 14})
    @map.setView([0, 0], 16)
    @map.on 'click', (data) =>
      c = @mc_coords(data.latlng)
      console.log('/tp '+c.x+' 100 '+c.y)

    @biomeTiles = new BiomeTileLayer({unloadInvisibleTiles:true, updateWhenIdle: true, continuousWorld: true})
    @biomeTiles.seed = @seed
    @biomeTiles.layer.addTo(@map)
    @biomeTiles.layer.on('tileunload', @tileUnload)
    @biomeTiles.layer.on('tileload', @tileLoad)

    @featureCache = new Cache(@featureProvider, 75)
    @slimeCache = new Cache(@slimeProvider, 75)
    m_opts = {
      shadowUrl: 'markers/marker-shadow.png',
      iconSize: [25, 41],
      iconAnchor: [12, 41],
      popupAnchor: [-3, -76],
      shadowSize: [41, 41],
      shadowAnchor: [13, 41]
    }
    @markers = {}
    @feature_makers = {}
    for feature in @features
      @markers[feature.name] = L.layerGroup();
      (() =>
        iconUrl = 'markers/'+feature.icon
        @feature_makers[feature.name] = (coords) =>
          L.marker(@map_coords(coords), {icon:L.icon(_.extend({iconUrl:iconUrl}, m_opts)), opacity:0.75, riseOnHover:true})
      )()
    #Special case for slimes chunks
    @feature_makers['Slime Chunks'] = (coords) =>
      L.rectangle([@map_coords(coords), @map_coords({x:coords.x+16, y:coords.y+16})],
        {color: "#00FF00", weight: 1, clickable:false, opacity:0.3});
    for name, layer of @markers
      @map.addLayer(layer)
    L.control.layers({}, @markers, {collapsed:true}).addTo(@map);

  remove: () ->
    @map.remove()
    @biomeTiles.remove()

  map_coords: (mc_coords) =>
    return @map.options.crs.pointToLatLng({x: mc_coords.x / 8, y: mc_coords.y / 8}, @biomeTiles.layer.options.nativeZoom)

  mc_coords: (latlng) =>
    pos = @map.options.crs.latLngToPoint(latlng, @biomeTiles.layer.options.nativeZoom)
    pos.x *= 8
    pos.y *= 8
    return pos

  tileCoords: (mc_coords) =>
    return {c_x:mc_coords.x >> 11, c_y:mc_coords.y >> 11} #11 = x/4*512

  mcCoordsFromTile: (tile_coords) ->
    return {x: tile_coords.x * (4*512), y: tile_coords.y * (4*512)}

  biomeAt: (mc_coords) =>
    tc = @tileCoords(mc_coords)
    data = @biomeTiles.cache.get(tc)
    x = (mc_coords.x >> 2) - (tc.c_x * 512)
    y = (mc_coords.y >> 2) - (tc.c_y * 512)
    if (data)
      [biomes, pixels] = data
    else
      return null
    return window.biome_map[biomes[x + 3 + (y + 3) * 518]]

  biomeAtBiomeCoords: (x,y) =>
    tc = {c_x:x >> 9, c_y:y >> 9}
    data = @biomeTiles.cache.get(tc)
    x = x - (tc.c_x * 512)
    y = y - (tc.c_y * 512)
    if (data)
      [biomes, pixels] = data
    else
      return null
    return window.biome_map[biomes[x + 3 + (y + 3) * 518]]

  setPlayer: (pos, dir) =>
    @player_marker ?= @feature_makers.Player(pos).addTo(@map)
    @player_marker.setLatLng(@map_coords(pos))
    @map.panTo(@map_coords(pos))

  tileLoad: (tile) =>
    tile = tile.tile
    async.parallel {
      slimes: (callback) =>
        @slimeCache.get(tile.coords, callback)
      features: (callback) =>
        @featureCache.get(tile.coords, callback)
      },
      (err, results) =>
        if err
          return
        feature_layers = {}
        results.features['Slime Chunks'] = results.slimes
        for feature_name, coords of results.features
          layer = L.layerGroup()
          for coord in coords
            @feature_makers[feature_name](coord).addTo(layer)
          feature_layers[feature_name] = layer
          layer.addTo(@markers[feature_name])
        tile.feature_layers = feature_layers

  tileUnload: (tile) =>
    tile = tile.tile
    for name, layer of tile.feature_layers
      @markers[name].removeLayer(layer)

  setLayerState: (name, state) =>
    console.log(name,state)

  checkBiomeRegion: (mc_coords, radius, attribute) ->
    left = mc_coords.x - radius >> 2;
    bottom = mc_coords.y - radius >> 2;
    right = mc_coords.x + radius >> 2;
    top = mc_coords.y + radius >> 2;
    for x in [left..right]
      for y in [top..bottom]
        biome = @biomeAtBiomeCoords(x,y)
        if biome
          if !biome[attribute]
            return false
        else
          return false
    return true


  featureProvider: (tile_coord, fcallback) =>
    console.time('Feature')
    features = {}
    spacing = 32 #Currently 32 for all features
    top_left = @mcCoordsFromTile(tile_coord)
    bottom_right = {x:top_left.x+512*4, y:top_left.y+512*4}
    feature_chunk = {
      top: Math.floor(top_left.y / (16*spacing)),
      left: Math.floor(top_left.x / (16*spacing)),
      bottom: Math.floor(bottom_right.y / (16*spacing))-1,
      right: Math.floor(bottom_right.x / (16*spacing))-1,
    }
    for c_y in [feature_chunk.top..feature_chunk.bottom]
      for c_x in [feature_chunk.left..feature_chunk.right]
        separation = 8 #For all except monument
        seed = Long.fromNumber(c_x).multiply(341873128712)
          .add(Long.fromNumber(c_y).multiply(132897987541))
          .add(@seed)
        village_seed = seed.add(10387312)
        rand = new JavaRand(village_seed)
        coords = {
          x: (c_x*32+rand.nextInt(spacing-separation))*16+8,
          y: (c_y*32+rand.nextInt(spacing-separation))*16+8
        }
        if @biomeAt(coords).village
          (features.Villages ||= []).push(coords)
        temple_seed = seed.add(14357617)
        rand = new JavaRand(temple_seed)
        coords = {
          x: (c_x*32+rand.nextInt(spacing-separation))*16+8,
          y: (c_y*32+rand.nextInt(spacing-separation))*16+8
        }
        biome = @biomeAt(coords)
        if biome.witch_hut
          (features['Witch Huts'] ||= []).push(coords)
        else if biome.jungle_temple
          (features['Jungle Temples'] ||= []).push(coords)
        else if biome.desert_temple
          (features['Desert Temples'] ||= []).push(coords)
        monument_seed = seed.add(10387313)
        separation = 5
        rand = new JavaRand(monument_seed)
        coords = {
          x: (c_x*32+(~~((rand.nextInt(spacing-separation)+rand.nextInt(spacing-separation)) / 2)))*16+8,
          y: (c_y*32+(~~((rand.nextInt(spacing-separation)+rand.nextInt(spacing-separation)) / 2)))*16+8
        }
        if @biomeAt(coords).monument && @checkBiomeRegion(coords, 29, 'aquatic')
          (features['Ocean Monuments'] ||= []).push(coords)
    console.timeEnd('Feature')
    fcallback(null, features)

  slimeProvider: (tile_coord, callback) =>
    slimes = []
    console.time('Slime')
    top_left = @mcCoordsFromTile(tile_coord)
    bottom_right = {x:top_left.x+512*4, y:top_left.y+512*4}
    chunk = {
      top: top_left.y >> 4,
      left: top_left.x >> 4,
      bottom: (bottom_right.y >> 4)-1,
      right: (bottom_right.x >> 4)-1,
    }
    x_sum = []
    for c_x in [chunk.left..chunk.right]
      l_c_x = Long.fromNumber(c_x)
      l_c_x_m_2_l = Long.fromInt(l_c_x.multiply(l_c_x).multiply(4987142).getLowBits())
      l_c_x_m_l = l_c_x.multiply(5947611).getLowBits()
      x_sum[c_x-chunk.left] = l_c_x_m_2_l.add(l_c_x_m_l)
    for c_y in [chunk.top..chunk.bottom]
      l_c_y = Long.fromNumber(c_y)
      l_c_y_2_l_m = Long.fromInt(l_c_y.multiply(l_c_y).getLowBits()).multiply(4392871)
      l_c_y_m = l_c_y.multiply(389711).getLowBits()
      y_sum = l_c_y_2_l_m.add(l_c_y_m)
      for c_x in [chunk.left..chunk.right]
        slime_seed = @seed.add(x_sum[c_x-chunk.left]).add(y_sum).xor(987234911)
        rand = new JavaRand(slime_seed)
        if rand.nextInt(10) == 0
          coords = {
            x: c_x * 16
            y: c_y * 16
          }
          slimes.push(coords)
    console.timeEnd('Slime')
    callback(null, slimes);
