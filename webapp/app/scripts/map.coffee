class window.MineMap
  constructor: (@el, @seed) ->
    @map = L.map(@el.get(0), {crs: L.CRS.Simple, maxZoom: 18, minZoom: 14})
    @map.setView([0, 0], 16)

    @biomeTiles = new BiomeTileLayer({unloadInvisibleTiles:true, updateWhenIdle: true, continuousWorld: true})
    @biomeTiles.seed = @seed
    @biomeTiles.layer.addTo(@map)
    @biomeTiles.layer.on('tileunload', @tileUnload)
    @biomeTiles.layer.on('tileload', @tileLoad)
    @markers = {}
    @markers.Villages = L.layerGroup();
    @markers['Jungle Temples'] = L.layerGroup();
    @markers['Desert Temples'] = L.layerGroup();
    @markers['Witch Huts'] = L.layerGroup();
    @markers['Ocean Monuments'] = L.layerGroup();
    @feature_makers = {}
    for name, markers of @markers
      @feature_makers[name] = (coords) =>
        L.marker(@map_coords(coords))

    @markers['Slime Chunks'] = L.layerGroup();
    @feature_makers['Slime Chunks'] = (coords) =>
      L.rectangle([@map_coords(coords), @map_coords({x:coords.x+16, y:coords.y+16})],
        {color: "#00FF00", weight: 1, clickable:false});
    for name, layer of @markers
      @map.addLayer(layer)
    L.control.layers({}, @markers, {collapsed:false}).addTo(@map);

  map_coords: (mc_coords) =>
    return @map.options.crs.pointToLatLng({x: mc_coords.x / 8, y: mc_coords.y / 8}, @biomeTiles.layer.options.nativeZoom)

  mc_coords: (latlng) =>
    pos = @map.options.crs.latLngToPoint(latlng, @biomeTiles.layer.options.nativeZoom)
    pos.x *= 8
    pos.y *= 8
    return pos

  tileCoords: (mc_coords) =>
    return {c_x:Math.floor(mc_coords.x / (4*512)), c_y:Math.floor(mc_coords.y / (4*512))}

  mcCoordsFromTile: (tile_coords) ->
    return {x: tile_coords.x * (4*512), y: tile_coords.y * (4*512)}

  biomeAt: (mc_coords) =>
    tc = @tileCoords(mc_coords)
    data = @biomeTiles.cache.get(tc)
    x = Math.floor(mc_coords.x/4) - (tc.c_x * 512)
    y = Math.floor(mc_coords.y/4) - (tc.c_y * 512)
    if (data)
      [biomes, pixels] = data
    else
      return null
    return window.biome_map[biomes[x + 3 + (y + 3) * 518]]

  setPlayer: (pos, dir) =>
    @player_marker ?= (L.marker(@map_coords({x: 0, y: 0})).addTo(@map))
    @player_marker.setLatLng(@map_coords(pos))
    @map.panTo(@map_coords(pos))

  tileLoad: (tile) =>
    tile = tile.tile
    feature_layers = {}
    features = @calcFeatures(tile.coords)
    for name, coords of features
      layer = L.layerGroup()
      for coord in coords
        @feature_makers[name](coord).addTo(layer)
      feature_layers[name] = layer
      layer.addTo(@markers[name])
    tile.feature_layers = feature_layers

  tileUnload: (tile) =>
    tile = tile.tile
    for name, layer of tile.feature_layers
      @markers[name].removeLayer(layer)

  calcFeatures: (tile_coord) =>
    features = {}
    spacing = 32 #Currently 32 for all features
    top_left = @mcCoordsFromTile(tile_coord)
    bottom_right = {x:top_left.x+512*4, y:top_left.y+512*4}
    feature_chunk = {
      top: Math.floor(top_left.y / (16*spacing)),
      left: Math.floor(top_left.x / (16*spacing)),
      bottom: Math.floor(bottom_right.y / (16*spacing)),
      right: Math.floor(bottom_right.x / (16*spacing)),
    }
    for c_y in [feature_chunk.top..feature_chunk.bottom]
      for c_x in [feature_chunk.left..feature_chunk.right]
        separation = 8 #For all except monument
        seed = Long.fromInt(c_x).multiply(341873128712)
          .add(Long.fromInt(c_y).multiply(132897987541))
          .add(@seed)
        village_seed = seed.add(10387312)
        rand = new JavaRand(village_seed)
        coords = {
          x: (c_x*32+rand.nextInt(spacing-separation))*16+8,
          y: (c_y*32+rand.nextInt(spacing-separation))*16+8
        }
        if @biomeAt(coords)?.name in ['Plains', 'Desert', 'Savanna']
          (features.Villages ||= []).push(coords)
        temple_seed = seed.add(14357617)
        rand = new JavaRand(temple_seed)
        coords = {
          x: (c_x*32+rand.nextInt(spacing-separation))*16+8,
          y: (c_y*32+rand.nextInt(spacing-separation))*16+8
        }
        biome = @biomeAt(coords)?.name
        if biome in ['Swampland']
          (features['Witch Huts'] ||= []).push(coords)
        else if biome in ['Jungle', 'Jungle Hills']
          (features['Jungle Temples'] ||= []).push(coords)
        else if biome in ['Desert', 'Desert Hills']
          (features['Desert Temples'] ||= []).push(coords)
        monument_seed = seed.add(10387313)
        separation = 5
        rand = new JavaRand(monument_seed)
        coords = {
          x: (c_x*32+(~~((rand.nextInt(spacing-separation)+rand.nextInt(spacing-separation)) / 2)))*16+8,
          y: (c_y*32+(~~((rand.nextInt(spacing-separation)+rand.nextInt(spacing-separation)) / 2)))*16+8
        }
        biome = @biomeAt(coords)?.name
        if biome in ['Deep Ocean']
          (features['Ocean Monuments'] ||= []).push(coords)
    chunk = {
      top: Math.floor(top_left.y / 16),
      left: Math.floor(top_left.x / 16),
      bottom: Math.floor(bottom_right.y / 16),
      right: Math.floor(bottom_right.x / 16),
    }
    console.time('Slime')
    for c_y in [chunk.top..chunk.bottom]
      for c_x in [chunk.left..chunk.right]
        slime_seed = @seed.add(c_x*c_x*4987142+c_x*5947611+c_y*c_y*4392871+c_y*389711)
        window.glob = @seed
        slime_seed = slime_seed.xor(987234911)
        rand = new JavaRand(slime_seed)
        if rand.nextInt(10) == 0
          coords = {
            x: c_x * 16
            y: c_y * 16
          }
          (features['Slime Chunks'] ||= []).push(coords)
    console.timeEnd('Slime')
    return features
