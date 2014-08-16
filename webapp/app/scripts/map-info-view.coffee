class window.MapInfoView extends Backbone.View
  initialize: ->
    @render

    @model.on
      'change': @render

  render: =>
    template = _.template($('#mapinfo-template').html(), @model.toJSON());
    @$el.html(template);