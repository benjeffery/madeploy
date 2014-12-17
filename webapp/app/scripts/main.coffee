L.Icon.Default.imagePath = '/styles/images'

class MapState extends Backbone.DeepModel
  defaults:
    features: [
      {name: 'Player', icon: 'player.png', active: true},
      {name: 'Likely Villages', icon: 'village.png', active: true},
      {name: 'Ocean Monuments', icon: 'ocean.png', active: true},
      {name: 'Jungle Temples', icon: 'chest.png', active: false},
      {name: 'Desert Temples', icon: 'chest.png', active: false},
      {name: 'Witch Huts', icon: 'witch.png', active: false},
      {name: 'Slime Chunks', icon: 'slime.png', active: false},
    ]
    mapCentreX: 0,
    mapCentreY: 0,
    mapZoom: 16,

stateToUrl = (state) ->
  seed = state.get('seed')
  obj = {
    levelName: state.get('levelName')
    seed: seed
    mapCentreX: state.get('mapCentreX'),
    mapCentreY: state.get('mapCentreY'),
    mapZoom: state.get('mapZoom'),
  }
  for f in state.get('features')
    if f.active?
      obj[f.name] = f.active
  if seed? && seed
    return "/?" + $.param(obj)
  else
    return "/"

applyUrlToState = (state, url) ->
  deparam = $.deparam(url)
  obj = {
    levelName: deparam.levelName || 'NoName',
    seed: deparam.seed
    mapCentreX: deparam.mapCentreX || 0,
    mapCentreY: deparam.mapCentreY || 0,
    mapZoom: deparam.mapZoom || 16,
    features: []
  }
  for f in state.get('features')
    if deparam[f.name]?
      f.active = deparam[f.name] == 'true'
    obj.features.push(f)
  state.set(obj)

map_state = new MapState

map_view = new MapView
  model: map_state
  el: '.minemap'

map_info_view = new MapInfoView
  model: map_state
  el: '.mapinfo'

applyUrlToState(map_state, window.location.search.substring(1))

map_state.on 'change:seed change:levelName change:features.* change:mapCentreX change:mapCentreY change:mapZoom', () ->
  window.history.replaceState({}, "title", stateToUrl(map_state));
  ZeroClipboard.setData("text/plain", window.location.href);

ZeroClipboard.setData("text/plain", window.location.href);

#map_state.set({
#  levelName:'Chunky Salsa',
#  seed:Long.fromInt(2020887652)
#})
