class window.MapInfoView extends Backbone.View
  initialize: ->
    @template = _.template($('#mapinfo-template').html());
    @clip = new ZeroClipboard()
    @render()
    @model.on
      'change': @render

  render: =>
    data = @model.toJSON()
    @$el.html(@template(data));
    if not @model.get('ZCdisable')
      @clip.unclip()
      if document.getElementById("clipboard")
        @clip.clip(document.getElementById("clipboard"));

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