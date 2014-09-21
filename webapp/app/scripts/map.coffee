class window.MineMap
  constructor: (@el, @seed) ->
    @map = L.map(@el.get(0), {crs: L.CRS.Simple, maxZoom: 18, minZoom: 14})
    @map.setView([0, 0], 16)

    @biomeTiles = new BiomeTileLayer({updateWhenIdle: true, continuousWorld: true, update_callback: @tile_drawn})
    @biomeTiles.seed = @seed
    @biomeTiles.layer.addTo(@map)

    @markers = {}
    @markers.Villages = L.layerGroup();
    @markers['Jungle Temples'] = L.layerGroup();
    @markers['Desert Temples'] = L.layerGroup();
    @markers['Witch Huts'] = L.layerGroup();
    @markers['Ocean Monuments'] = L.layerGroup();

    for name, layer of @markers
      @map.addLayer(layer)
    L.control.layers({}, @markers, {collapsed:false}).addTo(@map);
    @map.on 'moveend', (e) =>
      @repaintMarkers()
    @repaintMarkers()

  map_coords: (mc_coords) =>
    return @map.options.crs.pointToLatLng({x: mc_coords.x / 8, y: mc_coords.y / 8}, @biomeTiles.layer.options.nativeZoom)

  mc_coords: (latlng) =>
    pos = @map.options.crs.latLngToPoint(latlng, @biomeTiles.layer.options.nativeZoom)
    pos.x *= 8
    pos.y *= 8
    return pos

  tileCoords: (mc_coords) =>
    return {c_x:Math.floor(mc_coords.x / (4*512)), c_y:Math.floor(mc_coords.y / (4*512))}

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

  tile_drawn: () =>
    @repaintMarkers()

  repaintMarkers: () ->
    features = {}
    bounds = @map.getBounds()
    top_left = @mc_coords(bounds.getNorthWest())
    bottom_right = @mc_coords(bounds.getSouthEast())
    spacing = 32
    separation = 8
    feature_chunk = {
      top: Math.floor(top_left.y / 16 / spacing),
      left: Math.floor(top_left.x / 16 / spacing),
      bottom: Math.ceil(bottom_right.y / 16 / spacing),
      right: Math.ceil(bottom_right.x / 16 / spacing),
    }
    for c_y in [feature_chunk.top..feature_chunk.bottom]
      for c_x in [feature_chunk.left..feature_chunk.right]
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
    for name, markers of @markers
      markers.clearLayers()
      if features[name]
        for coords in features[name]
          L.marker(@map_coords(coords)).addTo(@markers[name])
