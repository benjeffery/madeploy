class window.MineMap
  constructor: (@el, @seed) ->
    @map = L.map(@el.get(0), {crs: L.CRS.Simple, maxZoom: 18, minZoom: 14})
    @map.setView([0, 0], 16)

    @biomeTiles = new BiomeTileLayer({updateWhenIdle: true, continuousWorld: true})
    @biomeTiles.seed = @seed
    @biomeTiles.layer.addTo(@map)

    @markers = {}
    @markers.Villages = L.layerGroup();
    @markers['Jungle Temples'] = L.layerGroup();
    @markers['Desert Temples'] = L.layerGroup();
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
    mc_coords.x = Math.floor(mc_coords.x/4) - (tc.c_x * 512)
    mc_coords.y = Math.floor(mc_coords.y/4) - (tc.c_y * 512)
    if (data)
      [biomes, pixels] = data
    else
      return null
    return window.biome_map[biomes[mc_coords.x + 3 + (mc_coords.y + 3) * 518]]

  setPlayer: (pos, dir) =>
    @player_marker ?= (L.marker(@map_coords({x: 0, y: 0})).addTo(@map))
    @player_marker.setLatLng(@map_coords(pos))
    @map.panTo(@map_coords(pos))

  repaintMarkers: () ->
    for name, markers of @markers
      markers.clearLayers()
    bounds = @map.getBounds()
    top_left = @mc_coords(bounds.getNorthWest())
    bottom_right = @mc_coords(bounds.getSouthEast())
    chunks = {
      top: Math.floor(top_left.y / 16),
      left: Math.floor(top_left.x / 16),
      bottom: Math.ceil(bottom_right.y / 16),
      right: Math.ceil(bottom_right.x / 16),
    }
    console.time('v')
    for c_y in [chunks.top..chunks.bottom]
      for c_x in [chunks.left..chunks.right]
        p1 = 32
        p2 = 8
        original_x = c_x
        original_y = c_y
        if c_x < 0
          c_x -= p1 - 1
        if c_y < 0
          c_y -= p1 - 1
        x = c_x
        y = c_y
        x = ~~(x / p1)
        y = ~~(y / p1)
        seed = Long.fromInt(x).multiply(341873128712)
          .add(Long.fromInt(y).multiply(132897987541))
          .add(@seed)
          .add(10387312)
        rand = new JavaRand(seed)
        x = x*p1
        y = y*p1
        x = x+rand.nextInt(p1-p2)
        y = y+rand.nextInt(p1-p2)
        c_x = original_x
        c_y = original_y
        if c_x == x && c_y == y
          L.marker(@map_coords({x: c_x * 16, y: c_y * 16})).addTo(@markers.Villages)
    console.timeEnd('v')