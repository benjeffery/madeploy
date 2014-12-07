class window.MapView extends Backbone.View
  initialize: ->
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
      'change:pos change:dir': () =>
        if @map?
          pos = @model.get 'pos'
          dir = @model.get 'dir'
          if pos? and dir?
            @map.setPlayer(pos,dir)

  render: =>
    seed = @model.get 'seed'
    if seed?
      @$seedInputEl.hide()
      @mapEl.show()
    else
      clearTimeout(@timeoutId) if @timeoutId
      @mapEl.hide()
      @$seedInputEl.show()
    if not @map? and seed?
      @map = new MineMap(@mapEl, seed)
      @map.map.on 'mousemove', (e) =>
        mc_coords = @map.mc_coords(e.latlng)
        @model.set mouse: mc_coords
        @model.set mouse_biome: @map.biomeAt(mc_coords)

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
      name = Long.fromString(val)
      seed = Long.fromString(val)
    else
      name = val
      seed = @stringHashCode(val)
    @model.set
      levelName: name
      seed: seed

  setFile: (evt) =>
    @levelFile = evt.target.files[0]
    @updateFromFile()

  updateFromFile: () =>
    reader = new FileReader();
    reader.onload = () =>
      nbt.parse reader.result, (error, result) =>
        #Seed is int64 so we have to handle it as string
        @model.set
          seed:result.Data.RandomSeed
          pos:{x:result.Data.Player.Pos[0], y:result.Data.Player.Pos[2]}
          dir:result.Data.Player.Rotation
          levelName: result.Data.LevelName
        #We have successfully parsed the file so we can update it
        @timeoutId = setTimeout(@updateFromFile, 1000)
    reader.readAsBinaryString(@levelFile)

  events:
    'click .text-seed': 'setSeedFromText'
    'change .level-file': 'setFile'