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

    @model.bind 'change', @render


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
    if @map?
      pos = @model.get 'pos'
      dir = @model.get 'dir'
      if pos? and dir?
        @map.setPlayer(pos,dir)
  setSeedFromText: () =>
    @model.set seed: @$('.seed-input > input').val()
    console.log(@model.get 'seed')

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
        #We have successfully parsed the file so we can update it
        setTimeout(@updateFromFile, 1000)
    reader.readAsBinaryString(@levelFile)

  events:
    'click .seed-input > button': 'setSeedFromText'
    'change .level-file': 'setFile'