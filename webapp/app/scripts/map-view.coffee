biome_data = [
  ["Ocean",			     0, [0, 0, 112]],
  ["Plains",				 1, [141, 179, 96]],
  ["Desert",				 2, [250, 148, 24]],
  ["Extreme Hills",	     3, [96, 96, 96]],
  ["Forest",				 4, [5, 102, 33]],
  ["Taiga",			     5, [11, 102, 89]],
  ["Swampland",			     6, [7, 249, 178]],
  ["River",			     7, [0, 0, 255]],
  ["Hell",				     8, [255, 0, 0]],
  ["Sky",					 9, [128, 128, 255]],
  ["Frozen Ocean",		    10, [144, 144, 160]],
  ["Frozen River",		    11, [160, 160, 255]],
  ["Ice Plains",			12, [255, 255, 255]],
  ["Ice Mountains",	    13, [160, 160, 160]],
  ["Mushroom Island",	    14, [255, 0, 255]],
  ["Mushroom Island Shore", 15, [160, 0, 255]],
  ["Beach",			    16, [250, 222, 85]],
  ["Desert Hills",		    17, [210, 95, 18]],
  ["Forest Hills",		    18, [34, 85, 28]],
  ["Taiga Hills",		    19, [22, 57, 51]],
  ["Extreme Hills Edge",	20, [114, 120, 154]],
  ["Jungle",				21, [83, 123, 9]],
  ["Jungle Hills",		    22, [44, 66, 5]],
  ["Jungle Edge",		    23, [98, 139, 23]],
  ["Deep Ocean",			24, [0, 0, 48]],
  ["Stone Beach",		    25, [162, 162, 132]],
  ["Cold Beach",			26, [250, 240, 192]],
  ["Birch Forest",		    27, [48, 116, 68]],
  ["Birch Forest Hills",	28, [31, 95, 50]],
  ["Roofed Forest",	    29, [64, 81, 26]],
  ["Cold Taiga",			30, [49, 85, 74]],
  ["Cold Taiga Hills",	    31, [36, 63, 54]],
  ["Mega Taiga",			32, [89, 102, 81]],
  ["Mega Taiga Hills",	    33, [69, 79, 62]],
  ["Extreme Hills+",		34, [80, 112, 80]],
  ["Savanna",			    35, [189, 178, 95]],
  ["Savanna Plateau",	    36, [167, 157, 100]],
  ["Mesa",				    37, [217, 69, 21]],
  ["Mesa Plateau F",		38, [176, 151, 101]],
  ["Mesa Plateau",		    39, [202, 140, 101]],
  ["Ocean M",				   128, [0, 0, 112]],
  ["Sunflower Plains",		   129, [141, 179, 96]],
  ["Desert M",				   130, [250, 148, 24]],
  ["Extreme Hills M",		   131, [96, 96, 96]],
  ["Flower Forest",			   132, [5, 102, 33]],
  ["Taiga M",				   133, [11, 102, 89]],
  ["Swampland M",			   134, [7, 249, 178]],
  ["River M",				   135, [0, 0, 255]],
  ["Hell M",				   136, [255, 0, 0]],
  ["Sky M",					   137, [128, 128, 255]],
  ["Frozen Ocean M",		   138, [144, 144, 160]],
  ["Frozen River M",		   139, [160, 160, 255]],
  ["Ice Plains Spikes",		   140, [140, 180, 180]],
  ["Ice Mountains M",		   141, [160, 160, 160]],
  ["Mushroom Island M",		   142, [255, 0, 255]],
  ["Mushroom Island Shore M",  143, [160, 0, 255]],
  ["Beach M",				   144, [250, 222, 85]],
  ["Desert Hills M",		   145, [210, 95, 18]],
  ["Forest Hills M",		   146, [34, 85, 28]],
  ["Taiga Hills M",			   147, [22, 57, 51]],
  ["Extreme Hills Edge M",	   148, [114, 120, 154]],
  ["Jungle M",				   149, [83, 123, 9]],
  ["Jungle Hills M",		   150, [44, 66, 5]],
  ["Jungle Edge M",			   151, [98, 139, 23]],
  ["Deep Ocean M",			   152, [0, 0, 48]],
  ["Stone Beach M",			   153, [162, 162, 132]],
  ["Cold Beach M",			   154, [250, 240, 192]],
  ["Birch Forest M",		   155, [48, 116, 68]],
  ["Birch Forest Hills M",	   156, [31, 95, 50]],
  ["Roofed Forest M",		   157, [64, 81, 26]],
  ["Cold Taiga M",			   158, [49, 85, 74]],
  ["Cold Taiga Hills M",	   159, [36, 63, 54]],
  ["Mega Spruce Taiga",		   160, [89, 102, 81]],
  ["Mega Spruce Taiga (Hills)",161, [69, 79, 62]],
  ["Extreme Hills+ M",		   162, [80, 112, 80]],
  ["Savanna M",				   163, [189, 178, 95]],
  ["Savanna Plateau M",		   164, [167, 157, 100]],
  ["Mesa (Bryce)",			   165, [217, 69, 21]],
  ["Mesa Plateau F M",		   166, [176, 151, 101]],
  ["Mesa Plateau M",		   167, [202, 140, 101]]];
biome_map = {};
for biome in biome_data
  biome_map[biome[1]] = {'name':biome[0], 'colour':biome[2]}

class MapView extends Backbone.View

  el: '.minemap'

  initialize: ->
    @model.bind 'change', @render
    @seedInputEl = $("
      <div class='seed-input'>
        <input type='text'>
        <button>Set Seed</button>
      </div>")
    $(@el).append(@seedInputEl)
    @mapEl = $("
      <div class='.leaflet-map'></div>")
    $(@el).append(@mapEl)
    @render()

  render: =>
    @mapEl.height(Math.min($(@el).width(), $(window).height()*0.80))
    if @model.get('seed') == undefined
      @mapEl.hide()
      @seedInputEl.show()
    else
      @seedInputEl.hide()
      @mapEl.show()

      request = (url, success, failure) ->
        xhr = new XMLHttpRequest();
        xhr.open('GET', url, true)
        xhr.responseType = 'arraybuffer';
        xhr.onreadystatechange = () ->
          if this.readyState == this.DONE
            if this.status == 200 && this.response != null
              success(new Uint8Array(this.response))
            else
              failure()
        xhr.send()

      map = L.map(@mapEl.get(0),
        crs: L.CRS.Simple
        maxZoom: 18
        minZoom: 14
      )
      map.setView([0,0], 16)
      canvasTiles = L.canvasTileLayer({updateWhenIdle:true, continuousWorld:true})
      canvasTiles._drawCanvasTile = (canvas, done) ->
        ctx = canvas.getContext('2d');
        canvas.width = 512
        canvas.height = 512
        request('http://localhost:8000/data?seed=0&type=Default'+'&x='+canvas.coords.x+'&y='+canvas.coords.y,
          (data) ->
            image_data = ctx.createImageData(canvas.width, canvas.height)
            imdata = image_data.data
            for d,p in data
              c = biome_map[d].colour
              imdata[4*p] = c[0]
              imdata[4*p+1] = c[1]
              imdata[4*p+2] = c[2]
              imdata[4*p+3] = 255
            ctx.putImageData(image_data,0,0)
            done(false, canvas)
          () ->
            console.log "error"
        )

      canvasTiles.addTo(map)

  setSeed: =>
      console.log('set')
      @model.set
        seed: '1234'

  events: 'click .seed-input > button': 'setSeed'

class Map extends Backbone.Model
  defaults:
    seed: undefined

map_view = new MapView model: new Map