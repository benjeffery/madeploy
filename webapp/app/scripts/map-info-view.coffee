class window.MapInfoView extends Backbone.View
  initialize: ->
    @render
    @model.on
      'change': @render
  render: =>
    template = _.template($('#mapinfo-template').html(), @model.toJSON());
    @$el.html(template);

  newMap: =>
    @model.set
      seed: undefined
      levelName: undefined

  toggleFeature: (a,b,c) =>
    console.log(a,b,c)

  events:
    'click .new-map > button': 'newMap'
    'click .feature-toggle': 'toggleFeature'