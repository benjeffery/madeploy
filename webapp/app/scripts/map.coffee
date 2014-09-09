class window.MineMap
  constructor: (@el, @seed) ->
    @cache = new Cache(@tileProvider, 75)
    @map = L.map(@el.get(0), {crs: L.CRS.Simple, maxZoom: 18, minZoom: 14})
    @map.setView([0, 0], 16)
    @canvasTiles = L.canvasTileLayer({updateWhenIdle: true, continuousWorld: true})
    @canvasTiles._drawCanvasTile = @drawTile
    @canvasTiles.addTo(@map)
    @worker_funcs = {
      init: () ->
        importScripts('scripts/seedrandom.js')
        importScripts('scripts/perlin.js')
        importScripts('scripts/biome_data.js')
        importScripts('scripts/seedrandom.js')
        self.PerlinSimplex.noiseDetail(3, .5)
        @parabolic = new Float32Array(25);
        for y in [-2 ... 2]
          for x in [-2 ... 2]
            @parabolic[x + 2 + (y+2)*5] =  10.0 / Math.sqrt((y * y + x * x) + 0.2)

      calc_pixels: (data, callback) ->
        b_data = new Uint8Array(data.biome_data)
        c_x = data.c_x
        c_y = data.c_y
        height_map = new Float32Array(514 * 514)
        noise_gen = self.PerlinSimplex.noise
        biome_map = self.biome_map
      #  noise = window.perlin
        console.time('b')
        for y in [0 ... 514]
          for x in [0 ... 514]
            p_d = (x+2) + (y+2) * 518
            p_h = x + y * 514
            biome = biome_map[b_data[p_d]]
            biome_offset = biome.offset
            offset = 0.0
            scale = 0.0
            sum = 0.0
            for sub_y in [-2 ... 2]
              for sub_x in [-2 ... 2]
                neighbour_biome = biome_map[b_data[(x+2+sub_x) + (y+2+sub_y) * 518]]
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
            #d = d - (scale/2)
            height_map[p_h] = d + scale * ((noise_gen(((x - 1) + c_x * 512) / 32, ((y - 1) + c_y * 512) / 32))*2-1)
            #height[p_h] = d + scale * (noise[p_h]*2-1)
        console.timeEnd('b')
        console.time('d')
        diffuse = new Float32Array(512 * 512)
        for y in [0 ... 512]
          for x in [0 ... 512]
            n_x = x + 1
            n_y = y + 1
            norm_x = height_map[n_x - 1 + n_y * 514] - height_map[n_x + 1 + n_y * 514]
            norm_y = height_map[n_x + (n_y + 1) * 514] - height_map[n_x + (n_y - 1) * 514]
            norm_z = 2.0 #256.0  #2*Sxy*Sz
            len = norm_x * norm_x + norm_y * norm_y + norm_z * norm_z
            if len > 0.0
              len = 1.0 / Math.sqrt(len)
              norm_x = norm_x * len
              norm_y = norm_y * len
              norm_z = norm_z * len
            d = -0.5773 * norm_x + 0.5773 * norm_y + 0.5773 * norm_z
            diffuse[x + y * 512] = if d > 0.0 then d else 0.0
        console.timeEnd('d')
        console.time('w')
        pixels = new Uint8ClampedArray(512*512*4)
        for y in [0 ... 512]
          for x in [0 ... 512]
            p = x + y * 512
            biome = biome_map[b_data[x + 3 + (y + 3) * 518]]
            c = biome.colour
            diff = diffuse[p]
            pixels[4 * p] = c[0] * Math.min(1, diff * 0.6 + 0.4)
            pixels[4 * p + 1] = c[1] * Math.min(1, diff * 0.6 + 0.4)
            pixels[4 * p + 2] = c[2] * Math.min(1, diff * 0.6 + 0.4)
            pixels[4 * p + 3] = 255
        console.timeEnd('w')
        seen = new Uint8Array(518*518)
        for y in [0 ... 518]
          for x in [0 ... 518]
            if seen[x + y * 518]
              continue
            to_check = [[x, y]]
            (
              pixel = to_check.pop()
            ) while (to_check.length)
            #current_biome = b_data[x + 3 + (y + 3) * 518]
            #[tot_x, tot_y] = [0,0]



        callback({pixels:pixels, biomes:b_data}, [pixels.buffer, b_data.buffer])
    }
    @workers = cw(@worker_funcs, 4)

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

  tileProvider: (params, callback) =>
    @request("http://localhost:8000/data?seed=#{@seed}&type=Default&x=#{params.c_x}&y=#{params.c_y}",
      (biome_data) =>
        data = {biome_data:biome_data.buffer, c_x:params.c_x, c_y:params.c_y}
        @workers.calc_pixels(data, [data.biome_data]).then (ret_data) ->
          callback([new Uint8Array(ret_data.biomes), new Uint8ClampedArray(ret_data.pixels)])
      () ->
       console.log "error"
    )


  drawTile: (canvas, done) =>
    ctx = canvas.getContext('2d');
    canvas.width = 512
    canvas.height = 512
    c_x = canvas.coords.x
    c_y = canvas.coords.y
    @cache.get({c_x:c_x, c_y:c_y},
      ([biomes, pixels]) =>
        imageData = ctx.createImageData(canvas.width, canvas.height)
        data = imageData.data
        if (data.set)
          data.set(pixels)
        else
          index = data.length - 1
          (data[index] = pixels[index]) while (index--)
        ctx.putImageData(imageData, 0, 0);
        done(false, canvas)
      )


  map_coords: (mc_coords) =>
    return @map.options.crs.pointToLatLng({x: mc_coords.x / 8, y: mc_coords.y / 8}, @canvasTiles.options.nativeZoom)

  mc_coords: (latlng) =>
    pos = @map.options.crs.latLngToPoint(latlng, @canvasTiles.options.nativeZoom)
    pos.x *= 8
    pos.y *= 8
    return pos

  tile_coords: (mc_coords) =>
    return {c_x:Math.floor(mc_coords.x / (4*512)), c_y:Math.floor(mc_coords.y / (4*512))}

  biome_at: (mc_coords) =>
    tc = @tile_coords(mc_coords)
    data = @cache.get(tc)
    mc_coords.x = Math.floor(mc_coords.x/4) - (tc.c_x * 512)
    mc_coords.y = Math.floor(mc_coords.y/4) - (tc.c_y * 512)
    if (data)
      [biomes, pixels] = data
    else
      return null
    return window.biome_map[biomes[mc_coords.x + 3 + (mc_coords.y + 3) * 518]]

  setPlayer: (pos, dir) =>
    @player_marker ?= (L.marker(@map_coords({x: 0, y: 0})).addTo(@map))
    @player_marker.setLatLng(@map_coords(pos))
    @map.panTo(@map_coords(pos))
