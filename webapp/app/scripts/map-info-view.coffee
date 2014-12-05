class window.MapInfoView extends Backbone.View
  initialize: ->
    @render

    @model.on
      'change': @render

  render: =>
    console.log( @model.toJSON())
    template = _.template($('#mapinfo-template').html(), @model.toJSON());
    @$el.html(template);