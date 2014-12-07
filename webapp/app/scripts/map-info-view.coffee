class window.MapInfoView extends Backbone.View
  initialize: ->
    @render
    @model.on
      'change': @render

  newMap: =>
    @model.set
      seed: undefined
      levelName: undefined

  render: =>
    template = _.template($('#mapinfo-template').html(), @model.toJSON());
    @$el.html(template);

  events:
    'click .new-map > button': 'newMap'
