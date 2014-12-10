L.Icon.Default.imagePath = '/styles/images'

class MapState extends Backbone.Model
  defaults:
    features: [
      {name: 'Player', icon: 'player.png', active: true},
      {name: 'Villages', icon: 'village.png', active: true},
      {name: 'Ocean Monuments', icon: 'ocean.png', active: true},
      {name: 'Jungle Temples', icon: 'chest.png'},
      {name: 'Desert Temples', icon: 'chest.png'},
      {name: 'Witch Huts', icon: 'witch.png'},
      {name: 'Slime Chunks', icon: 'slime.png'},
    ]

map_state = new MapState
map_view = new MapView
  model: map_state
  el: '.minemap'

map_info_view = new MapInfoView
  model: map_state
  el: '.mapinfo'

#map_state.set({
#  levelName:'Chunky Salsa',
#  seed:Long.fromInt(2020887652)
#})
