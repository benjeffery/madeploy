class window.MapView extends Backbone.View
  initialize: ->
    @$el.empty()
    @$seedInputEl = $($('#seed-input-template').html())
    @$el.append(@$seedInputEl)
    @mapEl = $("
      <div class='leaflet-map'></div>")
    @$el.append(@mapEl)
    @render()

    resize = () =>
      height = Math.min(@$el.width(), Math.max($(window).height()-@$el.position().top-10, @$seedInputEl.height()+30))
      @$el.height(height)
      @$seedInputEl.css('padding-top', (height-@$seedInputEl.height())/2)
    $(window).resize(resize)
    resize()

    @model.on
      'change:seed': @render,
      'change:pos.* change:dir.*': () =>
        if @map?
          pos = @model.get 'pos'
          dir = @model.get 'dir'
          if pos?
            @model.set('features.0.disabled', false)
            @map.setStaticFeature('Player', [pos])
      'change:mapCentreX change:mapCentreY change:mapZoom': () =>
        if !@supress_event
          @map?.map.setView(@map.map_coords({x:@model.get('mapCentreX'),y:@model.get('mapCentreY')}),
            @model.get('mapZoom'))
    for f, i in @model.get 'features'
      ((f,i) =>
        @model.on "change:features.#{i}.active", () =>
          if @map
            @map.setLayerState(f.name, @model.get("features.#{i}.active"))
      )(f,i)

  setLocation: (latlng) =>
    if latlng
      mc_coords = @map.mc_coords(latlng)
      @model.set
        mouse: mc_coords
        mouse_biome: @map.biomeAt(mc_coords)
    else
      @model.set
        mouse: null
        mouse_biome: null

  render: =>
    seed = @model.get 'seed'
    if seed? && seed
      @$seedInputEl.hide()
      @mapEl.show()
    else
      clearTimeout(@timeoutId) if @timeoutId
      @mapEl.hide()
      @$seedInputEl.show()
    if @map?
      @map.remove()
      @map = undefined
    if seed? && seed
      @map = new MineMap(
        @mapEl,
        Long.fromString(seed),
        @model.get('features'),
        @model.get('mapCentreX'),
        @model.get('mapCentreY'),
        @model.get('mapZoom'),
      )
      @map.map.on 'click', (e) =>
        @setLocation(e.latlng)
      @map.map.on 'mousemove', (e) =>
        @setLocation(e.latlng)
      @map.map.on 'mouseout', (e) =>
        @setLocation(null)
      @map.map.on 'moveend zoomend', (e) =>
        centre = @map.mc_coords(@map.map.getCenter())
        @supress_event = true
        @model.set
          mapCentreX: centre.x
          mapCentreY: centre.y
          mapZoom: @map.map.getZoom()
        @supress_event = false

  stringHashCode: (string) ->
    hash = 0
    return hash if string.length == 0
    for i in [0...string.length]
      char = string.charCodeAt(i);
      hash = ((hash<<5)-hash)+char;
      hash = hash & hash  #Convert to 32bit integer
    return hash

  setSeedFromText: () =>
    val = @$('.seed-in').val()
    if val.match(/^[-+]?\d+$/)
      name = val
      seed = Long.fromString(val)
    else
      name = val
      seed = Long.fromNumber(@stringHashCode(val))
    @model.set
      levelName: name
      seed: seed.toString()

  setFile: (evt) =>
    @levelFile = evt.target.files[0]
    @updateFromFile()

  updateFromFile: () =>
    reader = new FileReader();
    reader.onload = () =>
      nbt.parse reader.result, (error, result) =>
        #Seed is int64 so we have to handle it as string
        @model.set
          seed:result.Data.RandomSeed.toString()
          pos:{x:result.Data.Player.Pos[0], y:result.Data.Player.Pos[2]}
          dir:result.Data.Player.Rotation
          levelName: result.Data.LevelName
        #We have successfully parsed the file so we can update it
        @timeoutId = setTimeout(@updateFromFile, 1000)
    reader.readAsBinaryString(@levelFile)

  randomSeed: () =>
    randomSeed = ''
    for i in [0...15]
      randomSeed += Math.floor(10 * Math.random());
    randomSeed = '-' + randomSeed if Math.random() < .5
    @model.set
      levelName: "Random"
      seed: randomSeed

  events:
    'click .text-seed': 'setSeedFromText'
    'change .level-file': 'setFile'
    'click .random-seed': 'randomSeed'