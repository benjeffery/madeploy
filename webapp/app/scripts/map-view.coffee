class window.MapView extends Backbone.View
  initialize: ->
    @model.bind 'change', @render
    @seedInputEl = $("
      <div class='seed-input'>
        <input type='text'>
        <button>Set Seed</button>
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
      @map = new MineMap(@mapEl)

  setSeed: =>
      @model.set
        seed: '1234'

  events: 'click .seed-input > button': 'setSeed'