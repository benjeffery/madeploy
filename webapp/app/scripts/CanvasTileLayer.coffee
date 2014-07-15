# L.CanvasTileLayer is used for single zoom layer provided tiles drawn by canvas

L.CanvasTileLayer = L.GridLayer.extend
  options:
    minZoom: 0
    maxZoom: 18
    zoomOffset: 0
    nativeZoom: 15
#        zoomReverse: <Number>
#        detectRetina: <Number>

  initialize: (options) ->
    options = L.setOptions(this, options)
    #         detecting retina displays, adjusting tileSize and zoom levels
    if (options.detectRetina && L.Browser.retina && options.maxZoom > 0)
      options.tileSize = Math.floor(options.tileSize / 2)
      options.zoomOffset++
      options.minZoom = Math.max(0, options.minZoom)
      options.maxZoom--

  createTile: (coords, done) ->
    canvas = document.createElement('canvas')
    canvas.coords = coords
    tile = document.createElement('img')
    @_drawCanvasTile(canvas, () ->
      tile.src = canvas.toDataURL()
      done(false, tile)
    );
    #       Alt tag is set to empty string to keep screen readers from reading URL and for compliance reasons
    #       http://www.w3.org/TR/WCAG20-TECHS/H67
    tile.alt = ''
    return tile;

  _getTileSize: () ->
    map = this._map
    options = this.options
    zoom = map.getZoom() + options.zoomOffset
    zoomN = options.nativeZoom
    return Math.round(map.getZoomScale(zoom) / map.getZoomScale(zoomN) * options.tileSize)

L.canvasTileLayer = (options) ->
  new L.CanvasTileLayer(options)
