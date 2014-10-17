class window.Cache
  constructor: (@provider, @max_entries) ->
    @tiles = {}
    @lru = []

  get: (params, callback=null) ->
    key = JSON.stringify(params)
    if @tiles[key]
      @lru = _.without(@lru, key)
      @lru.push(key)
      if callback
        callback(null, @tiles[key])
      else
        return @tiles[key]
    else if callback
      @provider params, (error, data) =>
        if !error
          @tiles[key] = data
          @lru.push(key)
          if @lru.length > @max_entries
            @tiles[@lru[0]] = null
            @lru = @lru.slice(1)
          callback(null, data)
        else
          callback(error)

