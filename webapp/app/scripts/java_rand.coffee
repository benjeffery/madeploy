class window.JavaRand
  constructor: (seed) ->
    @multiplier = Long.fromString('5DEECE66D', false, 16)
    @addend = Long.fromString('B', false, 16)
    @mask = Long.fromInt(1).shiftLeft(48).subtract(1)
    #(seed ^ 0x5DEECE66DL) & ((1L << 48) - 1)
    @state = seed.xor(@multiplier).and(@mask)

  nextInt: ->
    #(seed * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1)
    @state = @state.multiply(@multiplier).add(@addend).and(@mask)
    #(int)(seed >>> (48 - bits))
    return @state.shiftRightUnsigned(48-32).toInt()

