multiplier = Long.fromString('5DEECE66D', false, 16)
addend = Long.fromString('B', false, 16)
mask = Long.fromInt(1).shiftLeft(48).subtract(1)
class window.JavaRand
  constructor: (seed) ->
    #(seed ^ 0x5DEECE66DL) & ((1L << 48) - 1)
    @state = seed.xor(multiplier).and(mask)

  next: (bits) ->
    #(seed * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1)
    @state = @state.multiply(multiplier).add(addend).and(mask)
    #(int)(seed >>> (48 - bits))
    return @state.shiftRightUnsigned(48-bits).toInt()

  nextInt: (n) ->
    if n?
      if ((n & -n) == n)  # i.e., n is a power of 2
        #return (int) ((n * (long)next(31)) >> 31);
        return Long.fromInt(@next(31)).multiply(n).shiftRight(31).toInt()
      while true
        bits = @next(31)
        val = bits % n
        break unless (bits - val + (n-1) < 0)
      return val;
    else
      return @next(32)

