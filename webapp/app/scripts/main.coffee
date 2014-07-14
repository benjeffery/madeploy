$(window).resize () ->
  $('.leaflet-map').height(Math.min($('.minemap').width(), $(window).height()*0.80))
  $('.minemap').height(Math.min($('.minemap').width(), $(window).height()*0.80))

class MapState extends Backbone.Model
#  defaults:
#   seed: nul

map_view = new MapView
  model: new MapState
  el: '.minemap'