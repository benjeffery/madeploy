class MapView extends Backbone.View

  el: '#minemap'

  initialize: ->
    @render()

  render: =>
    $(@el).append '<ul><li>Hello, Backbone!</li></ul>'

  map_view = new MapView()