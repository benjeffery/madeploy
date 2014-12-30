class window.MapInfoView extends Backbone.View
  initialize: ->
    @clip = new ZeroClipboard()
    @render()
    @model.on
      'change': @render

  render: =>
    data = @model.toJSON()
#    console.log(data)
    template = _.template($('#mapinfo-template').html(), data);
    @$el.html(template);
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