class window.MapView extends Backbone.View
  initialize: ->
    @model.bind 'change', @render
    @seedInputEl = $("
      <div class='seed-input'>
        <input type='text'>
        <button>Set Seed</button>
        <input type='file' class='level-file' name='level'/>
      </div>")
    @$el.append(@seedInputEl)
    @mapEl = $("
      <div class='.leaflet-map'></div>")
    @$el.append(@mapEl)
    @render()

  render: =>
    seed = @model.get('seed')
    @mapEl.height(Math.min(@$el.width(), $(window).height()*0.80))
    if seed?
      @seedInputEl.hide()
      @mapEl.show()
    else
      @mapEl.hide()
      @seedInputEl.show()
    if not @map? and seed?
      @map = new MineMap(@mapEl, seed)

  setSeed: () =>
    @model.set seed: @$('.seed-input > input').val()
    console.log(@model.get 'seed')

  setFile: (evt) =>
    @levelFile = evt.target.files[0]
    reader = new FileReader();
    reader.onload = () =>
      nbt.parse reader.result, (error, result) =>
        #Seed is int64 so we have to handle it as string
        seed = result.Data.RandomSeed.toString()
        @model.set seed:seed
        console.log(seed)
    reader.readAsBinaryString(@levelFile)

  events:
    'click .seed-input > button': 'setSeed'
    'change .level-file': 'setFile'