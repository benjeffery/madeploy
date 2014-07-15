class MapState extends Backbone.Model
#  defaults:
#   seed: nul

map_view = new MapView
  model: new MapState
  el: '.minemap'