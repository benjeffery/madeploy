sand_col = [181, 144, 66]
mesa_floor_col = [167, 87, 35]
mesa_top_col = [147, 90, 64]
biome_data = [
  ["Ocean", 0, [0, 0, 112]],
  ["Plains", 1, [141, 179, 96]],
  ["Desert", 2, sand_col],
  ["Extreme Hills", 3, [96, 96, 96]],
  ["Forest", 4, [5, 102, 33]],
  ["Taiga", 5, [11, 102, 89]],
  ["Swampland", 6, [7, 249, 178]],
  ["River", 7, [0, 0, 255]],
  ["Hell", 8, [255, 0, 0]],
  ["Sky", 9, [128, 128, 255]],
  ["Frozen Ocean", 10, [144, 144, 160]],
  ["Frozen River", 11, [160, 160, 255]],
  ["Ice Plains", 12, [255, 255, 255]],
  ["Ice Mountains", 13, [160, 160, 160]],
  ["Mushroom Island", 14, [255, 0, 255]],
  ["Mushroom Island Shore", 15, [160, 0, 255]],
  ["Beach", 16, [250, 222, 85]],
  ["Desert Hills", 17, sand_col],#[210, 95, 18]],
  ["Forest Hills", 18, [34, 85, 28]],
  ["Taiga Hills", 19, [22, 57, 51]],
  ["Extreme Hills Edge", 20, [114, 120, 154]],
  ["Jungle", 21, [83, 123, 9]],
  ["Jungle Hills", 22, [44, 66, 5]],
  ["Jungle Edge", 23, [98, 139, 23]],
  ["Deep Ocean", 24, [0, 0, 48]],
  ["Stone Beach", 25, [162, 162, 132]],
  ["Cold Beach", 26, [250, 240, 192]],
  ["Birch Forest", 27, [48, 116, 68]],
  ["Birch Forest Hills", 28, [31, 95, 50]],
  ["Roofed Forest", 29, [64, 81, 26]],
  ["Cold Taiga", 30, [49, 85, 74]],
  ["Cold Taiga Hills", 31, [36, 63, 54]],
  ["Mega Taiga", 32, [89, 102, 81]],
  ["Mega Taiga Hills", 33, [69, 79, 62]],
  ["Extreme Hills+", 34, [80, 112, 80]],
  ["Savanna", 35, [189, 178, 95]],
  ["Savanna Plateau", 36, [167, 157, 100]],
  ["Mesa", 37, mesa_floor_col],
  ["Mesa Plateau F", 38, mesa_top_col],
  ["Mesa Plateau", 39, mesa_top_col],
  ["Ocean M", 128, [0, 0, 112]],
  ["Sunflower Plains", 129, [141, 179, 96]],
  ["Desert M", 130, [250, 148, 24]],
  ["Extreme Hills M", 131, [96, 96, 96]],
  ["Flower Forest", 132, [5, 102, 33]],
  ["Taiga M", 133, [11, 102, 89]],
  ["Swampland M", 134, [7, 249, 178]],
  ["River M", 135, [0, 0, 255]],
  ["Hell M", 136, [255, 0, 0]],
  ["Sky M", 137, [128, 128, 255]],
  ["Frozen Ocean M", 138, [144, 144, 160]],
  ["Frozen River M", 139, [160, 160, 255]],
  ["Ice Plains Spikes", 140, [140, 180, 180]],
  ["Ice Mountains M", 141, [160, 160, 160]],
  ["Mushroom Island M", 142, [255, 0, 255]],
  ["Mushroom Island Shore M", 143, [160, 0, 255]],
  ["Beach M", 144, [250, 222, 85]],
  ["Desert Hills M", 145, [210, 95, 18]],
  ["Forest Hills M", 146, [34, 85, 28]],
  ["Taiga Hills M", 147, [22, 57, 51]],
  ["Extreme Hills Edge M", 148, [114, 120, 154]],
  ["Jungle M", 149, [83, 123, 9]],
  ["Jungle Hills M", 150, [44, 66, 5]],
  ["Jungle Edge M", 151, [98, 139, 23]],
  ["Deep Ocean M", 152, [0, 0, 48]],
  ["Stone Beach M", 153, [162, 162, 132]],
  ["Cold Beach M", 154, [250, 240, 192]],
  ["Birch Forest M", 155, [48, 116, 68]],
  ["Birch Forest Hills M", 156, [31, 95, 50]],
  ["Roofed Forest M", 157, [64, 81, 26]],
  ["Cold Taiga M", 158, [49, 85, 74]],
  ["Cold Taiga Hills M", 159, [36, 63, 54]],
  ["Mega Spruce Taiga", 160, [89, 102, 81]],
  ["Mega Spruce Taiga (Hills)", 161, [69, 79, 62]],
  ["Extreme Hills+ M", 162, [80, 112, 80]],
  ["Savanna M", 163, [189, 178, 95]],
  ["Savanna Plateau M", 164, [167, 157, 100]],
  ["Mesa (Bryce)", 165, [217, 69, 21]],
  ["Mesa Plateau F M", 166, [176, 151, 101]],
  ["Mesa Plateau M", 167, [202, 140, 101]]
]
heights = [
  [0, -1.000000, 0.100000],
  [1, 0.125000, 0.050000],
  [2, 0.125000, 0.050000],
  [3, 1.000000, 0.500000],
  [4, 0.100000, 0.200000],
  [5, 0.200000, 0.200000],
  [6, -0.200000, 0.100000],
  [7, -0.500000, 0.000000],
  [8, 0.100000, 0.200000],
  [9, 0.100000, 0.200000],
  [10, -1.000000, 0.100000],
  [11, -0.500000, 0.000000],
  [12, 0.125000, 0.050000],
  [13, 0.450000, 0.300000],
  [14, 0.200000, 0.300000],
  [15, 0.000000, 0.025000],
  [16, 0.000000, 0.025000],
  [17, 0.450000, 0.300000],
  [18, 0.450000, 0.300000],
  [19, 0.450000, 0.300000],
  [20, 0.800000, 0.300000],
  [21, 0.100000, 0.200000],
  [22, 0.450000, 0.300000],
  [23, 0.100000, 0.200000],
  [24, -1.800000, 0.100000],
  [25, 0.100000, 0.800000],
  [26, 0.000000, 0.025000],
  [27, 0.100000, 0.200000],
  [28, 0.450000, 0.300000],
  [29, 0.100000, 0.200000],
  [30, 0.200000, 0.200000],
  [31, 0.450000, 0.300000],
  [32, 0.200000, 0.200000],
  [33, 0.450000, 0.300000],
  [34, 1.000000, 0.500000],
  [35, 0.125000, 0.050000],
  [36, 1.500000, 0.025000],
  [37, 0.100000, 0.200000],
  [38, 1.500000, 0.025000],
  [39, 1.500000, 0.025000],
  [129, 0.125000, 0.050000],
  [130, 0.225000, 0.250000],
  [131, 1.000000, 0.500000],
  [132, 0.100000, 0.400000],
  [133, 0.300000, 0.400000],
  [134, -0.100000, 0.300000],
  [140, 0.425000, 0.450000],
  [149, 0.200000, 0.400000],
  [151, 0.200000, 0.400000],
  [155, 0.200000, 0.400000],
  [156, 0.550000, 0.500000],
  [157, 0.200000, 0.400000],
  [158, 0.300000, 0.400000],
  [160, 0.200000, 0.200000],
  [161, 0.200000, 0.200000],
  [162, 1.000000, 0.500000],
  [163, 0.362500, 1.225000],
  [164, 1.050000, 1.212500],
  [165, 0.100000, 0.200000],
  [166, 0.450000, 0.300000],
  [167, 0.450000, 0.300000],
]
biome_map = {};
for biome in biome_data
  biome_map[biome[1]] = {'name': biome[0], 'colour': biome[2]}
for height in heights
  biome_map[height[0]].offset = height[1]
  biome_map[height[0]].scale = 40*(height[2])# * 0.9 + 0.1)
_.keys(biome_map).forEach (key) ->
  console.log(biome_map[key])
class window.MineMap
  constructor: (@el, @seed) ->
    PerlinSimplex.noiseDetail(3, .5)
    @map = L.map(@el.get(0), {crs: L.CRS.Simple, maxZoom: 18, minZoom: 14})
    @map.setView([0, 0], 16)
    @canvasTiles = L.canvasTileLayer({updateWhenIdle: true, continuousWorld: true})
    @canvasTiles._drawCanvasTile = @drawTile
    @canvasTiles.addTo(@map)
    @parabolic = new Float32Array(25);
    for y in [-2 ... 2]
      for x in [-2 ... 2]
        @parabolic[x + 2 + (y+2)*5] =  10.0 / Math.sqrt((y * y + x * x) + 0.2)

  request: (url, success, failure) ->
    xhr = new XMLHttpRequest()
    xhr.open('GET', url, true)
    xhr.responseType = 'arraybuffer'
    xhr.onreadystatechange = () ->
      if this.readyState == this.DONE
        if this.status == 200 && this.response != null
          success(new Uint8Array(this.response))
        else
          failure()
    xhr.send()

  drawTile: (canvas, done) =>
    ctx = canvas.getContext('2d');
    canvas.width = 512
    canvas.height = 512
    c_x = canvas.coords.x
    c_y = canvas.coords.y
    @request("http://localhost:8000/data?seed=#{@seed}&type=Default&x=#{c_x}&y=#{c_y}",
    (data) =>
      image_data = ctx.createImageData(canvas.width, canvas.height)
      imdata = image_data.data
      height = new Float32Array(514 * 514)
      noise_gen = PerlinSimplex.noise
      for y in [0 ... 514]
        for x in [0 ... 514]
          p_d = (x+2) + (y+2) * 518
          p_h = x + y * 514
          biome = biome_map[data[p_d]]
          biome_offset = biome.offset
          offset = 0.0
          scale = 0.0
          sum = 0.0
          for sub_y in [-2 ... 2]
            for sub_x in [-2 ... 2]
              neighbour_biome = biome_map[data[(x+2+sub_x) + (y+2+sub_y) * 518]]
              n_offset = neighbour_biome.offset;
              n_scale = neighbour_biome.scale;
              para = @parabolic[sub_x + 2 + (sub_y + 2) * 5] / (n_offset + 2.0)
              if n_offset > biome_offset
                para /= 2.0

              scale += n_scale * para
              offset += n_offset * para
              sum += para
          scale /= sum;
          offset /= sum;
          a = (offset * 4 - 1) / 8
          b = a * 8.5 / 8
          c = 8.5 + b * 4
          d = c * 8
          d = d - (scale/2)
          height[p_h] = d + scale * (noise_gen(((x - 1) + c_x * 512) / 32, ((y - 1) + c_y * 512) / 32))
      diffuse = new Float32Array(512 * 512)
      for y in [0 ... 512]
        for x in [0 ... 512]
          n_x = x + 1
          n_y = y + 1
          norm_x = height[n_x - 1 + n_y * 514] - height[n_x + 1 + n_y * 514]
          norm_y = height[n_x + (n_y + 1) * 514] - height[n_x + (n_y - 1) * 514]
          norm_z = 2.0 #256.0  #2*Sxy*Sz
          len = norm_x * norm_x + norm_y * norm_y + norm_z * norm_z
          if len > 0.0
            len = 1.0 / Math.sqrt(len)
            norm_x = norm_x * len
            norm_y = norm_y * len
            norm_z = norm_z * len
          d = -0.5773 * norm_x + 0.5773 * norm_y + 0.5773 * norm_z
          diffuse[x + y * 512] = if d > 0.0 then d else 0.0
      for y in [0 ... 512]
        for x in [0 ... 512]
          p = x + y * 512
          d = data[x + 3 + (y + 3) * 518]
          c = biome_map[d].colour
          diff = diffuse[p]
          imdata[4 * p] = c[0] * Math.min(1, diff * 0.7 + 0.3)
          imdata[4 * p + 1] = c[1] * Math.min(1, diff * 0.7 + 0.3)
          imdata[4 * p + 2] = c[2] * Math.min(1, diff * 0.7 + 0.3)
          imdata[4 * p + 3] = 255


      ctx.putImageData(image_data, 0, 0)
      done(false, canvas)
      () ->
        console.log "error"
    )

  map_coords: (mc_coords) =>
    return @map.options.crs.pointToLatLng({x: mc_coords.x / 8, y: mc_coords.y / 8}, @canvasTiles.options.nativeZoom)

  setPlayer: (pos, dir) =>
    @player_marker ?= (L.marker(@map_coords({x: 0, y: 0})).addTo(@map))
    @player_marker.setLatLng(@map_coords(pos))
    @map.panTo(@map_coords(pos))
