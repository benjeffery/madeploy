sand_col = [191, 183, 85]
ice_col = [210,220,255]
blue_ice_col = [180,190,255]
mesa_floor_col = [167, 87, 35]
mesa_top_col = [147, 90, 64]
sea_col = [10,51,130]
deep_sea_col = [10,51,80]
savanna_col = [134, 154, 63]
mushroom_col = [201, 152, 119]
jungle_col = [83, 123, 9]
plains_col = [145,189,89]
taiga_col = [100,136,118]
cold_taiga_col = [145,194,170]
mega_taiga_col = [73, 93, 81]
ex_col = [94, 94, 94]
swamp_col = [53, 60, 44]
forest_col = [5, 102, 33]
birch_col = [48, 116, 68]
biome_data = [
  ["Ocean", 0, sea_col],#[0, 0, 112]],
  ["Deep Ocean", 24, deep_sea_col], #[0, 0, 48]],
  ["Frozen Ocean", 10, blue_ice_col],#[144, 144, 160]],
  ["River", 7, sea_col],
  ["Frozen River", 11, blue_ice_col],#[160, 160, 255]],
  ["Beach", 16, sand_col],
  ["Stone Beach", 25, [162, 162, 132]],
  ["Cold Beach", 26, ice_col],


  ["Plains", 1, plains_col],
  ["Sunflower Plains", 129, plains_col],

  ["Desert", 2, sand_col],
  ["Desert Hills", 17, sand_col],#[210, 95, 18]],
  ["Desert M", 130, sand_col], #water patches

  ["Extreme Hills", 3, ex_col],
  ["Extreme Hills Edge", 20, ex_col],
  ["Extreme Hills M", 131, ex_col],
  ["Extreme Hills+", 34, ex_col]
  ["Extreme Hills+ M", 162, ex_col],

  ["Forest", 4, forest_col],
  ["Forest Hills", 18, forest_col],
  ["Birch Forest", 27, birch_col],
  ["Birch Forest Hills", 28, birch_col],
  ["Birch Forest M", 155, birch_col],
  ["Birch Forest Hills M", 156, birch_col],
  ["Roofed Forest", 29, [64, 81, 26]],
  ["Roofed Forest M", 157, [64, 81, 26]],
  ["Flower Forest", 132, forest_col],

  ["Taiga", 5, taiga_col],
  ["Taiga Hills", 19, taiga_col],
  ["Cold Taiga", 30, cold_taiga_col],
  ["Cold Taiga M", 158, cold_taiga_col]
  ["Cold Taiga Hills", 31, cold_taiga_col],
  ["Mega Taiga", 32, mega_taiga_col],
  ["Mega Taiga Hills", 33, mega_taiga_col],
  ["Taiga M", 133, taiga_col],
  ["Mega Spruce Taiga", 160, mega_taiga_col],
  ["Redwood Taiga Hills M", 161, mega_taiga_col],

  ["Swampland", 6, swamp_col],
  ["Swampland M", 134, swamp_col],

  ["Ice Plains", 12, ice_col],
  ["Ice Plains Spikes", 140, ice_col, 'spikes'],
  ["Ice Mountains", 13, ice_col],

  ["Mushroom Island", 14, mushroom_col, 'mushroom'],
  ["Mushroom Island Shore", 15, mushroom_col],


  ["Jungle", 21, jungle_col],
  ["Jungle Hills", 22, jungle_col],
  ["Jungle Edge", 23, jungle_col],
  ["Jungle M", 149, jungle_col],
  ["Jungle Edge M", 151, jungle_col],

  ["Savanna", 35, savanna_col],#[189, 178, 95]],
  ["Savanna Plateau", 36, savanna_col],#[167, 157, 100]],
  ["Savanna M", 163, savanna_col],#[189, 178, 95]],
  ["Savanna Plateau M", 164, savanna_col],#[167, 157, 100]],

  ["Mesa", 37, mesa_floor_col],
  ["Mesa Plateau F", 38, mesa_top_col],
  ["Mesa Plateau", 39, mesa_top_col],
  ["Mesa (Bryce)", 165, mesa_floor_col, 'spikes'],#[217, 69, 21]],
  ["Mesa Plateau F M", 166, mesa_top_col],#[176, 151, 101]],
  ["Mesa Plateau M", 167, mesa_top_col],#[202, 140, 101]]
]
heights = [
  [0, -1.000000, 0],#0.100000],
  [1, 0.125000, 0.050000],
  [2, 0.125000, 0.050000],
  [3, 1.000000, 0.500000],
  [4, 0.100000, 0.200000],
  [5, 0.200000, 0.200000],
  [6, -0.200000, 0.100000],
  [7, -0.500000, 0.000000],
  [10, -1.000000, 0]#0.100000],
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
  [24, -1,0],#-1.800000, 0.100000],
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
self.biome_map = {}
for biome in biome_data
  self.biome_map[biome[1]] = {
    name: biome[0],
    colour: biome[2],
    decorator:biome[3],
    aquatic:false,
    monument:false,
    village:false,
    witch_hut:false,
    jungle_temple:false,
    desert_temple:false,
    }
self.biome_name_map = {}
for num, biome of self.biome_map
  self.biome_name_map[biome.name] = biome
for height in heights
  self.biome_map[height[0]].offset = height[1]
  self.biome_map[height[0]].scale = 40*(height[2])# * 0.9 + 0.1)
for name in ['Ocean', 'Deep Ocean', 'Frozen Ocean', 'River', 'Frozen River']
  self.biome_name_map[name].aquatic = true
for name in ['Plains', 'Desert', 'Savanna']
  self.biome_name_map[name].village = true
for name in ['Jungle', 'Jungle Hills']
  self.biome_name_map[name].jungle_temple = true
for name in ['Desert', 'Desert Hills']
  self.biome_name_map[name].desert_temple = true
self.biome_name_map['Deep Ocean'].monument = true
self.biome_name_map['Swampland'].witch_hut = true

self.images = {
  spruce: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAACXBIWXMAAAABAAAAAQBPJcTWAAAAHnRFWHRUaXRsZQBFVkVSR1JFRU4gVFJFRSAoVSsxRjMzMik3n+5wAAAAFXRFWHRBdXRob3IAQW5kcmV3IE1hcmN1c2XnNzeDAAAAL3RFWHRTb2Z0d2FyZQBpbmZvLmZpbGVmb3JtYXQuZGF0YS5Vbmljb2RlUG5nU2VydmxldGgBfzAAAABDdEVYdERlc2NyaXB0aW9uAGh0dHA6Ly93d3cuZmlsZWZvcm1hdC5pbmZvL2luZm8vdW5pY29kZS8xZjMzMi9pbmRleC5odG3UGFcIAAAAO3RFWHRDb3B5cmlnaHQAaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbGljZW5zZXMvYnktbmMtc2EvMi4wL2yIkoMAAAQlSURBVHja7ZxbiE1RGMcX4zouw5gLhpFQpiaXESZKuYsXnkxRkktII7nLwxQvLkU8kDy45QEx08SI0SCETK5RJuM2bg8SMcy4jO/rfLtZs87e5+xzm7PK/1f/mrP32nvq/5+911rfWmeUAgAAAAAAAAAQKZNJP2CDPewiNZHSYYUdVEkg02BF8skiNUoge2FH8lknYbA+kTrBkuTRkfRCC4S1ErYkj41GGKwPpO6wpvXpQ/rqEghrH+xpXdqSKj3CYP0lTYJNrcfmEGE4ek/qDasSzxTSLx+BsG6ROsOyxJFP+mKYfod0Vn7+TbponC+VVxyIMwNIrzWj2fxNYvYyOfZdPm8gNWhtD5LawML4MYj0SjOYf56onV+unXP6jWGkau34MVI7WBk7I0lvxVT+q99B6mq0uaAZP187zgGslyeHz5VjjhIb80j1YuZp0mCXNnOMPqPS43VXJudrSMNhbWT0Ih0VAy+Txni0S5fhrTm6KvRoP4v0VAXWTkowAvNHBqmOdN3oJ9w4EWK469WJp5AWkh6oQB0sFZaHp72PNovDzEFW+7gHKsNxYoS8dkIF8pM0ClYlnhzSG58z9ZekTFiWONJI932GgfJJK4RxO8IwHFWQOsDC+I683MLgfqTUOHaI9NmlbZnPwQLwUTZ5ZpjLa+fbSNnSRu/IlfQbB1RwVfgMRlaxMVPMdwytJRWTumhtUg3Ts7VzQ0iHjWBuoqOPHN68sF0FVv7YxLukuTKpM5ltBLLIo3SyWzUv+T4njYbN/hhHeiLGnQ8zW+dSe7URyGOP4JjuMmGsladmKzp7b3KlFNIgr5l8H9es9RhVFYe5joPkouQ1mauskKcSaKxSgdJ6js/2harlIpQuLrfn+bxPAem49DcgSvor9yqvLq7q9oBViacn6ZHPCWEVhrmJhVcKb0Q4Sy/HhDAx8HzjapSlk3N4UuJLN9X8HRC3XYr65z8hXl9psDJ2MmVi6FbH4lFZunGcw1ujmtfidfEqYT9YGj0FMk8wn4AjMm9xcM41ascGkk65hPIOs/ToSidbVPCqYLnHhNE5/81jvlKhglcTl8Dm8PA+qqWq5Q7FJunMx4e4LlQg+tN2VMJw2p9U+KKoJ1zKqFHB+3an+7hWn6GHI0tKLg/lmo8qsLkOW02Fvi6vFF6MmhXBPZzr6iP83bxhbqcKrNHfIxWp/7ymxXODOs3QS6SpUdxHH3lFAz8dE0j75Y/jv2aPCqz+DY3hHm6jLJBE9CExsCiQJnTO9gWCFUDLAukKO+wKJAN22BVILuywK5A82GFXIGNhh12BzIAddgWyAHbYFUgJ7LArkCuww65AWEWwxK5AeFcjdi0mEV5X4e+F8MYG/l8nKbAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABs5B9uiddeB7PCXwAAAABJRU5ErkJggg=="
}

`
/**

seedrandom.js
=============

Seeded random number generator for Javascript.

version 2.3.6<br>
Author: David Bau<br>
Date: 2014 May 14

Can be used as a plain script, a node.js module or an AMD module.

Script tag usage
----------------

<script src=//cdnjs.cloudflare.com/ajax/libs/seedrandom/2.3.6/seedrandom.min.js>
</script>

// Sets Math.random to a PRNG initialized using the given explicit seed.
Math.seedrandom('hello.');
console.log(Math.random());          // Always 0.9282578795792454
console.log(Math.random());          // Always 0.3752569768646784

// Sets Math.random to an ARC4-based PRNG that is autoseeded using the
// current time, dom state, and other accumulated local entropy.
// The generated seed string is returned.
Math.seedrandom();
console.log(Math.random());          // Reasonably unpredictable.

// Seeds using the given explicit seed mixed with accumulated entropy.
Math.seedrandom('added entropy.', { entropy: true });
console.log(Math.random());          // As unpredictable as added entropy.

// Use "new" to create a local prng without altering Math.random.
var myrng = new Math.seedrandom('hello.');
console.log(myrng());                // Always 0.9282578795792454


Node.js usage
-------------

npm install seedrandom

// Local PRNG: does not affect Math.random.
var seedrandom = require('seedrandom');
var rng = seedrandom('hello.');
console.log(rng());                  // Always 0.9282578795792454

// Autoseeded ARC4-based PRNG.
rng = seedrandom();
console.log(rng());                  // Reasonably unpredictable.

// Global PRNG: set Math.random.
seedrandom('hello.', { global: true });
console.log(Math.random());          // Always 0.9282578795792454

// Mixing accumulated entropy.
rng = seedrandom('added entropy.', { entropy: true });
console.log(rng());                  // As unpredictable as added entropy.


Require.js usage
----------------

Similar to node.js usage:

bower install seedrandom

require(['seedrandom'], function(seedrandom) {
  var rng = seedrandom('hello.');
  console.log(rng());                  // Always 0.9282578795792454
});


Network seeding via a script tag
--------------------------------

<script src=//cdnjs.cloudflare.com/ajax/libs/seedrandom/2.3.6/seedrandom.min.js>
</script>
<!-- Seeds using urandom bits from a server. -->
<script src=//jsonlib.appspot.com/urandom?callback=Math.seedrandom">
</script>

Examples of manipulating the seed for various purposes:

var seed = Math.seedrandom();        // Use prng with an automatic seed.
document.write(Math.random());       // Pretty much unpredictable x.

var rng = new Math.seedrandom(seed); // A new prng with the same seed.
document.write(rng());               // Repeat the 'unpredictable' x.

function reseed(event, count) {      // Define a custom entropy collector.
  var t = [];
  function w(e) {
    t.push([e.pageX, e.pageY, +new Date]);
    if (t.length < count) { return; }
    document.removeEventListener(event, w);
    Math.seedrandom(t, { entropy: true });
  }
  document.addEventListener(event, w);
}
reseed('mousemove', 100);            // Reseed after 100 mouse moves.

The "pass" option can be used to get both the prng and the seed.
The following returns both an autoseeded prng and the seed as an object,
without mutating Math.random:

var obj = Math.seedrandom(null, { pass: function(prng, seed) {
  return { random: prng, seed: seed };
}});


Version notes
-------------

The random number sequence is the same as version 1.0 for string seeds.
* Version 2.0 changed the sequence for non-string seeds.
* Version 2.1 speeds seeding and uses window.crypto to autoseed if present.
* Version 2.2 alters non-crypto autoseeding to sweep up entropy from plugins.
* Version 2.3 adds support for "new", module loading, and a null seed arg.
* Version 2.3.1 adds a build environment, module packaging, and tests.
* Version 2.3.4 fixes bugs on IE8, and switches to MIT license.
* Version 2.3.6 adds a readable options object argument.

The standard ARC4 key scheduler cycles short keys, which means that
seedrandom('ab') is equivalent to seedrandom('abab') and 'ababab'.
Therefore it is a good idea to add a terminator to avoid trivial
equivalences on short string seeds, e.g., Math.seedrandom(str + '\0').
Starting with version 2.0, a terminator is added automatically for
non-string seeds, so seeding with the number 111 is the same as seeding
with '111\0'.

When seedrandom() is called with zero args or a null seed, it uses a
seed drawn from the browser crypto object if present.  If there is no
crypto support, seedrandom() uses the current time, the native rng,
and a walk of several DOM objects to collect a few bits of entropy.

Each time the one- or two-argument forms of seedrandom are called,
entropy from the passed seed is accumulated in a pool to help generate
future seeds for the zero- and two-argument forms of seedrandom.

On speed - This javascript implementation of Math.random() is several
times slower than the built-in Math.random() because it is not native
code, but that is typically fast enough.  Some details (timings on
Chrome 25 on a 2010 vintage macbook):

* seeded Math.random()          - avg less than 0.0002 milliseconds per call
* seedrandom('explicit.')       - avg less than 0.2 milliseconds per call
* seedrandom('explicit.', true) - avg less than 0.2 milliseconds per call
* seedrandom() with crypto      - avg less than 0.2 milliseconds per call

Autoseeding without crypto is somewhat slower, about 20-30 milliseconds on
a 2012 windows 7 1.5ghz i5 laptop, as seen on Firefox 19, IE 10, and Opera.
Seeded rng calls themselves are fast across these browsers, with slowest
numbers on Opera at about 0.0005 ms per seeded Math.random().


LICENSE (MIT)
-------------

Copyright (c)2014 David Bau.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

/**
 * All code is in an anonymous closure to keep the global namespace clean.
 */
(function (
    global, pool, math, width, chunks, digits, module, define, rngname) {

//
// The following constants are related to IEEE 754 limits.
//
var startdenom = math.pow(width, chunks),
    significance = math.pow(2, digits),
    overflow = significance * 2,
    mask = width - 1,

//
// seedrandom()
// This is the seedrandom function described above.
//
impl = math['seed' + rngname] = function(seed, options, callback) {
  var key = [];
  options = (options == true) ? { entropy: true } : (options || {});

  // Flatten the seed string or build one from local entropy if needed.
  var shortseed = mixkey(flatten(
    options.entropy ? [seed, tostring(pool)] :
    (seed == null) ? autoseed() : seed, 3), key);

  // Use the seed to initialize an ARC4 generator.
  var arc4 = new ARC4(key);

  // Mix the randomness into accumulated entropy.
  mixkey(tostring(arc4.S), pool);

  // Calling convention: what to return as a function of prng, seed, is_math.
  return (options.pass || callback ||
      // If called as a method of Math (Math.seedrandom()), mutate Math.random
      // because that is how seedrandom.js has worked since v1.0.  Otherwise,
      // it is a newer calling convention, so return the prng directly.
      function(prng, seed, is_math_call) {
        if (is_math_call) { math[rngname] = prng; return seed; }
        else return prng;
      })(

  // This function returns a random double in [0, 1) that contains
  // randomness in every bit of the mantissa of the IEEE 754 value.
  function() {
    var n = arc4.g(chunks),             // Start with a numerator n < 2 ^ 48
        d = startdenom,                 //   and denominator d = 2 ^ 48.
        x = 0;                          //   and no 'extra last byte'.
    while (n < significance) {          // Fill up all significant digits by
      n = (n + x) * width;              //   shifting numerator and
      d *= width;                       //   denominator and generating a
      x = arc4.g(1);                    //   new least-significant-byte.
    }
    while (n >= overflow) {             // To avoid rounding up, before adding
      n /= 2;                           //   last byte, shift everything
      d /= 2;                           //   right using integer math until
      x >>>= 1;                         //   we have exactly the desired bits.
    }
    return (n + x) / d;                 // Form the number within [0, 1).
  }, shortseed, 'global' in options ? options.global : (this == math));
};

//
// ARC4
//
// An ARC4 implementation.  The constructor takes a key in the form of
// an array of at most (width) integers that should be 0 <= x < (width).
//
// The g(count) method returns a pseudorandom integer that concatenates
// the next (count) outputs from ARC4.  Its return value is a number x
// that is in the range 0 <= x < (width ^ count).
//
/** @constructor */
function ARC4(key) {
  var t, keylen = key.length,
      me = this, i = 0, j = me.i = me.j = 0, s = me.S = [];

  // The empty key [] is treated as [0].
  if (!keylen) { key = [keylen++]; }

  // Set up S using the standard key scheduling algorithm.
  while (i < width) {
    s[i] = i++;
  }
  for (i = 0; i < width; i++) {
    s[i] = s[j = mask & (j + key[i % keylen] + (t = s[i]))];
    s[j] = t;
  }

  // The "g" method returns the next (count) outputs as one number.
  (me.g = function(count) {
    // Using instance members instead of closure state nearly doubles speed.
    var t, r = 0,
        i = me.i, j = me.j, s = me.S;
    while (count--) {
      t = s[i = mask & (i + 1)];
      r = r * width + s[mask & ((s[i] = s[j = mask & (j + t)]) + (s[j] = t))];
    }
    me.i = i; me.j = j;
    return r;
    // For robust unpredictability discard an initial batch of values.
    // See http://www.rsa.com/rsalabs/node.asp?id=2009
  })(width);
}

//
// flatten()
// Converts an object tree to nested arrays of strings.
//
function flatten(obj, depth) {
  var result = [], typ = (typeof obj), prop;
  if (depth && typ == 'object') {
    for (prop in obj) {
      try { result.push(flatten(obj[prop], depth - 1)); } catch (e) {}
    }
  }
  return (result.length ? result : typ == 'string' ? obj : obj + '\0');
}

//
// mixkey()
// Mixes a string seed into a key that is an array of integers, and
// returns a shortened string seed that is equivalent to the result key.
//
function mixkey(seed, key) {
  var stringseed = seed + '', smear, j = 0;
  while (j < stringseed.length) {
    key[mask & j] =
      mask & ((smear ^= key[mask & j] * 19) + stringseed.charCodeAt(j++));
  }
  return tostring(key);
}

//
// autoseed()
// Returns an object for autoseeding, using window.crypto if available.
//
/** @param {Uint8Array|Navigator=} seed */
function autoseed(seed) {
  try {
    global.crypto.getRandomValues(seed = new Uint8Array(width));
    return tostring(seed);
  } catch (e) {
    return [+new Date, global, (seed = global.navigator) && seed.plugins,
            global.screen, tostring(pool)];
  }
}

//
// tostring()
// Converts an array of charcodes to a string
//
function tostring(a) {
  return String.fromCharCode.apply(0, a);
}

//
// When seedrandom.js is loaded, we immediately mix a few bits
// from the built-in RNG into the entropy pool.  Because we do
// not want to intefere with determinstic PRNG state later,
// seedrandom will not call math.random on its own again after
// initialization.
//
mixkey(math[rngname](), pool);

//
// Nodejs and AMD support: export the implemenation as a module using
// either convention.
//
if (module && module.exports) {
  module.exports = impl;
} else if (define && define.amd) {
  define(function() { return impl; });
}

// End anonymous scope, and pass initial values.
})(
  this,   // global window object
  [],     // pool: entropy pool starts empty
  Math,   // math: package containing random, pow, and seedrandom
  256,    // width: each RC4 output is 0 <= x < 256
  6,      // chunks: at least six RC4 outputs for each double
  52,     // digits: there are 52 significant digits in a double
  (typeof module) == 'object' && module,    // present in node.js
  (typeof define) == 'function' && define,  // present with an AMD loader
  'random'// rngname: name for Math.random and Math.seedrandom
);


//=================================================================================================================

// PerlinSimplex 1.2
// Ported from Stefan Gustavson's java implementation by Sean McCullough banksean@gmail.com
// http://staffwww.itn.liu.se/~stegu/simplexnoise/simplexnoise.pdf
// Read Stefan's excellent paper for details on how this code works.
// octaves and falloff implementation (and passing jslint) by Ron Valstar
// also implemented Karsten Schmidt's implementation
if (!self.PerlinSimplex) {
  self.PerlinSimplex = function() {

    var F2 = 0.5*(Math.sqrt(3)-1);
    var G2 = (3-Math.sqrt(3))/6;
    var G22 = 2*G2 - 1;
    var F3 = 1/3;
    var G3 = 1/6;
    var F4 = (Math.sqrt(5) - 1)/4;
    var G4 = (5 - Math.sqrt(5))/20;
    var G42 = G4*2;
    var G43 = G4*3;
    var G44 = G4*4 - 1;
    // Gradient vectors for 3D (pointing to mid points of all edges of a unit cube)
    var aGrad3 = [[1,1,0],[-1,1,0],[1,-1,0],[-1,-1,0],[1,0,1],[-1,0,1],[1,0,-1],[-1,0,-1],[0,1,1],[0,-1,1],[0,1,-1],[0,-1,-1]];
    // Gradient vectors for 4D (pointing to mid points of all edges of a unit 4D hypercube)
    var grad4 = [[0,1,1,1],[0,1,1,-1],[0,1,-1,1],[0,1,-1,-1],[0,-1,1,1],[0,-1,1,-1],[0,-1,-1,1],[0,-1,-1,-1],[1,0,1,1],[1,0,1,-1],[1,0,-1,1],[1,0,-1,-1],[-1,0,1,1],[-1,0,1,-1],[-1,0,-1,1],[-1,0,-1,-1],[1,1,0,1],[1,1,0,-1],[1,-1,0,1],[1,-1,0,-1],[-1,1,0,1],[-1,1,0,-1],[-1,-1,0,1],[-1,-1,0,-1],[1,1,1,0],[1,1,-1,0],[1,-1,1,0],[1,-1,-1,0],[-1,1,1,0],[-1,1,-1,0],[-1,-1,1,0],[-1,-1,-1,0]];
    // To remove the need for index wrapping, double the permutation table length
    var aPerm;
    // A lookup table to traverse the simplex around a given point in 4D.
    // Details can be found where this table is used, in the 4D noise method.
    var simplex = [[0,1,2,3],[0,1,3,2],[0,0,0,0],[0,2,3,1],[0,0,0,0],[0,0,0,0],[0,0,0,0],[1,2,3,0],[0,2,1,3],[0,0,0,0],[0,3,1,2],[0,3,2,1],[0,0,0,0],[0,0,0,0],[0,0,0,0],[1,3,2,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[1,2,0,3],[0,0,0,0],[1,3,0,2],[0,0,0,0],[0,0,0,0],[0,0,0,0],[2,3,0,1],[2,3,1,0],[1,0,2,3],[1,0,3,2],[0,0,0,0],[0,0,0,0],[0,0,0,0],[2,0,3,1],[0,0,0,0],[2,1,3,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[2,0,1,3],[0,0,0,0],[0,0,0,0],[0,0,0,0],[3,0,1,2],[3,0,2,1],[0,0,0,0],[3,1,2,0],[2,1,0,3],[0,0,0,0],[0,0,0,0],[0,0,0,0],[3,1,0,2],[0,0,0,0],[3,2,0,1],[3,2,1,0]];
    //
    var g;
    var n0, n1, n2, n3, n4;
    var s;
    var c;
    var sc;
    var i, j, k, l;
    var t;
    var x0, y0, z0, w0;
    var i1, j1, k1, l1;
    var i2, j2, k2, l2;
    var i3, j3, k3, l3;
    var x1, y1, z1, w1;
    var x2, y2, z2, w2;
    var x3, y3, z3, w3;
    var x4, y4, z4, w4;
    var ii, jj, kk, ll;
    var gi0, gi1, gi2, gi3, gi4;
    var t0, t1, t2, t3, t4;
    //
    //
    var oRng = Math;
    var iOctaves = 1;
    var fPersistence = 0.5;
    var fResult, fFreq, fPers;
    var aOctFreq; // frequency per octave
    var aOctPers; // persistence per octave
    var fPersMax; // 1 / max persistence
    //
    // octFreqPers
    var octFreqPers = function octFreqPers() {
      var fFreq, fPers;
      aOctFreq = [];
      aOctPers = [];
      fPersMax = 0;
      for (var i=0;i<iOctaves;i++) {
        fFreq = Math.pow(2,i);
        fPers = Math.pow(fPersistence,i);
        fPersMax += fPers;
        aOctFreq.push( fFreq );
        aOctPers.push( fPers );
      }
      fPersMax = 1 / fPersMax;
    };
    // 1D dotproduct
    var dot1 = function dot1(g, x) {
      return g[0]*x;
    };
    // 2D dotproduct
    var dot2 = function dot2(g, x, y) {
      return g[0]*x + g[1]*y;
    };
    // 3D dotproduct
    var dot3 = function dot3(g, x, y, z) {
      return g[0]*x + g[1]*y + g[2]*z;
    };
    // 4D dotproduct
    var dot4 = function dot4(g, x, y, z, w) {
      return g[0]*x + g[1]*y + g[2]*z + g[3]*w;
    };
    // setPerm
    var setPerm = function setPerm() {
      var i;
      var p = [];
      for (i=0; i<256; i++) {
        p[i] = Math.floor(oRng.random()*256);
      }
      // To remove the need for index wrapping, double the permutation table length
      aPerm = [];
      for(i=0; i<512; i++) {
        aPerm[i] = p[i & 255];
      }
    };
    // noise2d
    var noise2d = function noise2d(x, y) {
      // Skew the input space to determine which simplex cell we're in
      s = (x+y)*F2; // Hairy factor for 2D
      i = Math.floor(x+s);
      j = Math.floor(y+s);
      t = (i+j)*G2;
      x0 = x - (i - t); // Unskew the cell origin back to (x,y) space
      y0 = y - (j - t); // The x,y distances from the cell origin
      // For the 2D case, the simplex shape is an equilateral triangle.
      // Determine which simplex we are in.
      // Offsets for second (middle) corner of simplex in (i,j) coords
      if (x0>y0) { // lower triangle, XY order: (0,0)->(1,0)->(1,1)
        i1 = 1;
        j1 = 0;
      }  else { // upper triangle, YX order: (0,0)->(0,1)->(1,1)
        i1 = 0;
        j1 = 1;
      }
      // A step of (1,0) in (i,j) means a step of (1-c,-c) in (x,y), and
      // a step of (0,1) in (i,j) means a step of (-c,1-c) in (x,y), where
      // c = (3-sqrt(3))/6
      x1 = x0 - i1 + G2; // Offsets for middle corner in (x,y) unskewed coords
      y1 = y0 - j1 + G2;
      x2 = x0 + G22; // Offsets for last corner in (x,y) unskewed coords
      y2 = y0 + G22;
      // Work out the hashed gradient indices of the three simplex corners
      ii = i&255;
      jj = j&255;
      // Calculate the contribution from the three corners
      t0 = 0.5 - x0*x0-y0*y0;
      if (t0<0) {
        n0 = 0;
      } else {
        t0 *= t0;
        gi0 = aPerm[ii+aPerm[jj]] % 12;
        n0 = t0 * t0 * dot2(aGrad3[gi0], x0, y0);  // (x,y) of aGrad3 used for 2D gradient
      }
      t1 = 0.5 - x1*x1-y1*y1;
      if (t1<0) {
        n1 = 0;
      } else {
        t1 *= t1;
        gi1 = aPerm[ii+i1+aPerm[jj+j1]] % 12;
        n1 = t1 * t1 * dot2(aGrad3[gi1], x1, y1);
      }
      t2 = 0.5 - x2*x2-y2*y2;
      if (t2<0) {
        n2 = 0;
      } else {
        t2 *= t2;
        gi2 = aPerm[ii+1+aPerm[jj+1]] % 12;
        n2 = t2 * t2 * dot2(aGrad3[gi2], x2, y2);
      }
      // Add contributions from each corner to get the final noise value.
      // The result is scaled to return values in the interval [0,1].
      return 70 * (n0 + n1 + n2);
    };
    // noise3d
    var noise3d = function noise3d(x,y,z) {
      // Noise contributions from the four corners
      // Skew the input space to determine which simplex cell we're in
      s = (x+y+z)*F3; // Very nice and simple skew factor for 3D
      i = Math.floor(x+s);
      j = Math.floor(y+s);
      k = Math.floor(z+s);
      t = (i+j+k)*G3;
      x0 = x - (i - t); // Unskew the cell origin back to (x,y,z) space
      y0 = y - (j - t); // The x,y,z distances from the cell origin
      z0 = z - (k - t);
      // For the 3D case, the simplex shape is a slightly irregular tetrahedron.
      // Determine which simplex we are in.
      // Offsets for second corner of simplex in (i,j,k) coords
      // Offsets for third corner of simplex in (i,j,k) coords
      if (x0>=y0) {
        if (y0>=z0) { // X Y Z order
          i1 = 1;
          j1 = 0;
          k1 = 0;
          i2 = 1;
          j2 = 1;
          k2 = 0;
        } else if (x0>=z0) { // X Z Y order
          i1 = 1;
          j1 = 0;
          k1 = 0;
          i2 = 1;
          j2 = 0;
          k2 = 1;
        } else { // Z X Y order
          i1 = 0;
          j1 = 0;
          k1 = 1;
          i2 = 1;
          j2 = 0;
          k2 = 1;
        }
      } else { // x0<y0
        if (y0<z0) { // Z Y X order
          i1 = 0;
          j1 = 0;
          k1 = 1;
          i2 = 0;
          j2 = 1;
          k2 = 1;
        } else if (x0<z0) { // Y Z X order
          i1 = 0;
          j1 = 1;
          k1 = 0;
          i2 = 0;
          j2 = 1;
          k2 = 1;
        } else { // Y X Z order
          i1 = 0;
          j1 = 1;
          k1 = 0;
          i2 = 1;
          j2 = 1;
          k2 = 0;
        }
      }
      // A step of (1,0,0) in (i,j,k) means a step of (1-c,-c,-c) in (x,y,z),
      // a step of (0,1,0) in (i,j,k) means a step of (-c,1-c,-c) in (x,y,z), and
      // a step of (0,0,1) in (i,j,k) means a step of (-c,-c,1-c) in (x,y,z), where
      // c = 1/6.
      x1 = x0 - i1 + G3; // Offsets for second corner in (x,y,z) coords
      y1 = y0 - j1 + G3;
      z1 = z0 - k1 + G3;
      x2 = x0 - i2 + F3; // Offsets for third corner in (x,y,z) coords
      y2 = y0 - j2 + F3;
      z2 = z0 - k2 + F3;
      x3 = x0 - 0.5; // Offsets for last corner in (x,y,z) coords
      y3 = y0 - 0.5;
      z3 = z0 - 0.5;
      // Work out the hashed gradient indices of the four simplex corners
      ii = i&255;
      jj = j&255;
      kk = k&255;
      // Calculate the contribution from the four corners
      t0 = 0.6 - x0*x0 - y0*y0 - z0*z0;
      if (t0<0) {
        n0 = 0;
      } else {
        t0 *= t0;
        gi0 = aPerm[ii+aPerm[jj+aPerm[kk]]] % 12;
        n0 = t0 * t0 * dot3(aGrad3[gi0], x0, y0, z0);
      }
      t1 = 0.6 - x1*x1 - y1*y1 - z1*z1;
      if (t1<0) {
        n1 = 0;
      } else {
        t1 *= t1;
        gi1 = aPerm[ii+i1+aPerm[jj+j1+aPerm[kk+k1]]] % 12;
        n1 = t1 * t1 * dot3(aGrad3[gi1], x1, y1, z1);
      }
      t2 = 0.6 - x2*x2 - y2*y2 - z2*z2;
      if (t2<0) {
        n2 = 0;
      } else {
        t2 *= t2;
        gi2 = aPerm[ii+i2+aPerm[jj+j2+aPerm[kk+k2]]] % 12;
        n2 = t2 * t2 * dot3(aGrad3[gi2], x2, y2, z2);
      }
      t3 = 0.6 - x3*x3 - y3*y3 - z3*z3;
      if (t3<0) {
        n3 = 0;
      } else {
        t3 *= t3;
        gi3 = aPerm[ii+1+aPerm[jj+1+aPerm[kk+1]]] % 12;
        n3 = t3 * t3 * dot3(aGrad3[gi3], x3, y3, z3);
      }
      // Add contributions from each corner to get the final noise value.
      // The result is scaled to stay just inside [0,1]
      return 32 * (n0 + n1 + n2 + n3);
    };
    // noise4d
    var noise4d = function noise4d(x,y,z,w) {
      // from the five corners
      // Skew the (x,y,z,w) space to determine which cell of 24 simplices
      s = (x + y + z + w) * F4; // Factor for 4D skewing
      i = Math.floor(x + s);
      j = Math.floor(y + s);
      k = Math.floor(z + s);
      l = Math.floor(w + s);
      t = (i + j + k + l) * G4; // Factor for 4D unskewing
      x0 = x - (i - t); // The x,y,z,w distances from the cell origin
      y0 = y - (j - t);
      z0 = z - (k - t);
      w0 = w - (l - t);
      // For the 4D case, the simplex is a 4D shape I won't even try to describe.
      // To find out which of the 24 possible simplices we're in, we need to determine the magnitude ordering of x0, y0, z0 and w0.
      // The method below is a good way of finding the ordering of x,y,z,w and then find the correct traversal order for the simplex were in.
      // First, six pair-wise comparisons are performed between each possible pair of the four coordinates, and the results are used to add up binary bits for an integer index.
      c = 0;
      if (x0>y0) {
        c = 0x20;
      }
      if (x0>z0) {
        c |= 0x10;
      }
      if (y0>z0) {
        c |= 0x08;
      }
      if (x0>w0) {
        c |= 0x04;
      }
      if (y0>w0) {
        c |= 0x02;
      }
      if (z0>w0) {
        c |= 0x01;
      }
      // simplex[c] is a 4-vector with the numbers 0, 1, 2 and 3 in some
      // order. Many values of c will never occur, since e.g. x>y>z>w makes
      // x<z, y<w and x<w impossible. Only the 24 indices which have non-zero
      // entries make any sense. We use a thresholding to set the coordinates
      // in turn from the largest magnitude. The number 3 in the "simplex"
      // array is at the position of the largest coordinate.
      sc = simplex[c];
      i1 = sc[0] >= 3 ? 1 : 0;
      j1 = sc[1] >= 3 ? 1 : 0;
      k1 = sc[2] >= 3 ? 1 : 0;
      l1 = sc[3] >= 3 ? 1 : 0;
      // The number 2 in the "simplex" array is at the second largest
      // coordinate.
      i2 = sc[0] >= 2 ? 1 : 0;
      j2 = sc[1] >= 2 ? 1 : 0;
      k2 = sc[2] >= 2 ? 1 : 0;
      l2 = sc[3] >= 2 ? 1 : 0;
      // The number 1 in the "simplex" array is at the second smallest
      // coordinate.
      i3 = sc[0] >= 1 ? 1 : 0;
      j3 = sc[1] >= 1 ? 1 : 0;
      k3 = sc[2] >= 1 ? 1 : 0;
      l3 = sc[3] >= 1 ? 1 : 0;
      // The fifth corner has all coordinate offsets = 1, so no need to look
      // that up.
      x1 = x0 - i1 + G4; // Offsets for second corner in (x,y,z,w)
      y1 = y0 - j1 + G4;
      z1 = z0 - k1 + G4;
      w1 = w0 - l1 + G4;

      x2 = x0 - i2 + G42; // Offsets for third corner in (x,y,z,w)
      y2 = y0 - j2 + G42;
      z2 = z0 - k2 + G42;
      w2 = w0 - l2 + G42;

      x3 = x0 - i3 + G43; // Offsets for fourth corner in (x,y,z,w)
      y3 = y0 - j3 + G43;
      z3 = z0 - k3 + G43;
      w3 = w0 - l3 + G43;

      x4 = x0 + G44; // Offsets for last corner in (x,y,z,w)
      y4 = y0 + G44;
      z4 = z0 + G44;
      w4 = w0 + G44;

      // Work out the hashed gradient indices of the five simplex corners
      ii = i&255;
      jj = j&255;
      kk = k&255;
      ll = l&255;

      // Calculate the contribution from the five corners
      t0 = 0.6 - x0*x0 - y0*y0 - z0*z0 - w0*w0;
      if (t0<0) {
        n0 = 0;
      } else {
        t0 *= t0;
        gi0 = aPerm[ii + aPerm[jj + aPerm[kk + aPerm[ll]]]]%32;
        n0 = t0*t0*dot4(grad4[gi0], x0, y0, z0, w0);
      }
      t1 = 0.6 - x1*x1 - y1*y1 - z1*z1 - w1*w1;
      if (t1<0) {
        n1 = 0;
      } else {
        t1 *= t1;
        gi1 = aPerm[ii + i1 + aPerm[jj + j1 + aPerm[kk + k1 + aPerm[ll + l1]]]]%32;
        n1 = t1*t1*dot4(grad4[gi1], x1, y1, z1, w1);
      }
      t2 = 0.6 - x2*x2 - y2*y2 - z2*z2 - w2*w2;
      if (t2<0) {
        n2 = 0;
      } else {
        t2 *= t2;
        gi2 = aPerm[ii + i2 + aPerm[jj + j2 + aPerm[kk + k2 + aPerm[ll + l2]]]]%32;
        n2 = t2*t2*dot4(grad4[gi2], x2, y2, z2, w2);
      }
      t3 = 0.6 - x3*x3 - y3*y3 - z3*z3 - w3*w3;
      if (t3<0) {
        n3 = 0;
      } else {
        t3 *= t3;
        gi3 = aPerm[ii + i3 + aPerm[jj + j3 + aPerm[kk + k3 + aPerm[ll + l3]]]]%32;
        n3 = t3*t3*dot4(grad4[gi3], x3, y3, z3, w3);
      }
      t4 = 0.6 - x4*x4 - y4*y4 - z4*z4 - w4*w4;
      if (t4<0) {
        n4 = 0;
      } else {
        t4 *= t4;
        gi4 = aPerm[ii + 1 + aPerm[jj + 1 + aPerm[kk + 1 + aPerm[ll + 1]]]]%32;
        n4 = t4*t4*dot4(grad4[gi4], x4, y4, z4, w4);
      }
      // Sum up and scale the result to cover the range [-1,1]
      return 27.0*(n0 + n1 + n2 + n3 + n4);
    };
    // init
    Math.seedrandom('WTF');
    setPerm();
    // return
    return {
      noise: function(x,y,z,w) {
        fResult = 0;
        for (g=0;g<iOctaves;g++) {
          fFreq = aOctFreq[g];
          fPers = aOctPers[g];
          switch (arguments.length) {
            case 4:  fResult += fPers*noise4d(fFreq*x,fFreq*y,fFreq*z,fFreq*w); break;
            case 3:  fResult += fPers*noise3d(fFreq*x,fFreq*y,fFreq*z); break;
            default: fResult += fPers*noise2d(fFreq*x,fFreq*y);
          }
        }
        return ( fResult*fPersMax + 1 )*0.5;
      },noiseDetail: function(octaves,falloff) {
        iOctaves = octaves||iOctaves;
        fPersistence = falloff||fPersistence;
        octFreqPers();
      },setRng: function(r) {
        oRng = r;
        setPerm();
      },toString: function() {
        return "[object PerlinSimplex "+iOctaves+" "+fPersistence+"]";
      }
    };
  }();
}
`