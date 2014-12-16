class window.MapInfoView extends Backbone.View
  initialize: ->
    @render()
    @model.on
      'change': @render

  render: =>
    data = @model.toJSON()
    template = _.template($('#mapinfo-template').html(), data);
    @$el.html(template);

  newMap: =>
    @model.set
      seed: false
      levelName: false

  toggleFeature: (evt) =>
    features = @model.get('features')
    for f,i in features
      if f.name == evt.currentTarget.id.replace('_',' ')
        index = i
    key = 'features.'+index+'.active'
    @model.set(key, !@model.get(key))

  events:
    'click .new-map > button': 'newMap'
    'click .feature-toggle': 'toggleFeature'