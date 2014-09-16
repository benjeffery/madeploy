L.Icon.Default.imagePath = '/styles/images'

class MapState extends Backbone.Model
#  defaults:
#   seed: nul

map_state = new MapState
map_view = new MapView
  model: map_state
  el: '.minemap'

map_info_view = new MapInfoView
  model: map_state
  el: '.mapinfo'

map_state.set({seed:2020887652})