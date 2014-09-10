class window.MapView extends Backbone.View
  initialize: ->
    @seedInputEl = $("
      <div class='seed-input'>
        <input type='text'>
        <button>Set Seed</button>
        <input type='file' class='level-file' name='level'/>
      </div>")
    @$el.append(@seedInputEl)
    @mapEl = $("
      <div class='leaflet-map'></div>")
    @$el.append(@mapEl)
    @render()

    $(window).resize () =>
      @$el.height(Math.min(@$el.width(), $(window).height()*0.80))
    @$el.height(Math.min(@$el.width(), $(window).height()*0.80))

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
      @seedInputEl.hide()
      @mapEl.show()
    else
      @mapEl.hide()
      @seedInputEl.show()
    if not @map? and seed?
      @map = new MineMap(@mapEl, seed)
      @map.map.on 'mousemove', (e) =>
        mc_coords = @map.mc_coords(e.latlng)
        @model.set mouse: mc_coords
        @model.set mouse_biome: @map.biomeAt(mc_coords)


  setSeedFromText: () =>
    @model.set seed: @$('.seed-input > input').val()

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
        #We have successfully parsed the file so we can update it
        setTimeout(@updateFromFile, 1000)
    reader.readAsBinaryString(@levelFile)

  events:
    'click .seed-input > button': 'setSeedFromText'
    'change .level-file': 'setFile'