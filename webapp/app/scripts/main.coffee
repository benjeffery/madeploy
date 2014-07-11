$(window).resize () ->
  $('.leaflet-map').height(Math.min($('.minemap').width(), $(window).height()*0.80))
  $('.minemap').height(Math.min($('.minemap').width(), $(window).height()*0.80))