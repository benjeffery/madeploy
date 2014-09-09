sand_col = [181, 144, 66]
ice_col = [210,220,255]
blue_ice_col = [180,190,255]
mesa_floor_col = [167, 87, 35]
mesa_top_col = [147, 90, 64]
sea_col = [10,51,130]
deep_sea_col = [10,51,80]
savanna_col = [189, 218, 95]
mushroom_col = [201, 152, 119]
jungle_col = [83, 123, 9]
biome_data = [
  ["Ocean", 0, sea_col],#[0, 0, 112]],
  ["Deep Ocean", 24, deep_sea_col], #[0, 0, 48]],
  ["Frozen Ocean", 10, blue_ice_col],#[144, 144, 160]],
  ["River", 7, sea_col],
  ["Frozen River", 11, blue_ice_col],#[160, 160, 255]],
  ["Beach", 16, [250, 222, 85]],
  ["Stone Beach", 25, [162, 162, 132]],
  ["Cold Beach", 26, ice_col],


  ["Plains", 1, [141, 179, 96]],
  ["Sunflower Plains", 129, [141, 179, 96]],

  ["Desert", 2, sand_col],
  ["Desert Hills", 17, sand_col],#[210, 95, 18]],
  ["Desert M", 130, sand_col], #water patches

  ["Extreme Hills", 3, [96, 96, 96]],
  ["Extreme Hills Edge", 20, [114, 120, 154]],
  ["Extreme Hills M", 131, [96, 96, 96]],
  ["Extreme Hills+", 34, [80, 112, 80]],
  ["Extreme Hills+ M", 162, [80, 112, 80]],

  ["Forest", 4, [5, 102, 33]],
  ["Forest Hills", 18, [34, 85, 28]],
  ["Birch Forest", 27, [48, 116, 68]],
  ["Birch Forest Hills", 28, [31, 95, 50]],
  ["Birch Forest M", 155, [48, 116, 68]],
  ["Birch Forest Hills M", 156, [31, 95, 50]],
  ["Roofed Forest", 29, [64, 81, 26]],
  ["Roofed Forest M", 157, [64, 81, 26]],
  ["Flower Forest", 132, [5, 102, 33]],

  ["Taiga", 5, [11, 102, 89]],
  ["Taiga Hills", 19, [22, 57, 51]],
  ["Cold Taiga", 30, [49, 85, 74]],
  ["Cold Taiga M", 158, [49, 85, 74]]
  ["Cold Taiga Hills", 31, [36, 63, 54]],
  ["Mega Taiga", 32, [89, 102, 81]],
  ["Mega Taiga Hills", 33, [69, 79, 62]],
  ["Taiga M", 133, [11, 102, 89]],
  ["Mega Spruce Taiga", 160, [89, 102, 81]],
  ["Mega Spruce Taiga (Hills)", 161, [69, 79, 62]],

  ["Swampland", 6, [7, 249, 178]],
  ["Swampland M", 134, [7, 249, 178]],

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
  self.biome_map[biome[1]] = {'name': biome[0], 'colour': biome[2], 'decorator':biome[3]}
for height in heights
  self.biome_map[height[0]].offset = height[1]
  self.biome_map[height[0]].scale = 40*(height[2])# * 0.9 + 0.1)

self.images = {
  spruce: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAACXBIWXMAAAABAAAAAQBPJcTWAAAAHnRFWHRUaXRsZQBFVkVSR1JFRU4gVFJFRSAoVSsxRjMzMik3n+5wAAAAFXRFWHRBdXRob3IAQW5kcmV3IE1hcmN1c2XnNzeDAAAAL3RFWHRTb2Z0d2FyZQBpbmZvLmZpbGVmb3JtYXQuZGF0YS5Vbmljb2RlUG5nU2VydmxldGgBfzAAAABDdEVYdERlc2NyaXB0aW9uAGh0dHA6Ly93d3cuZmlsZWZvcm1hdC5pbmZvL2luZm8vdW5pY29kZS8xZjMzMi9pbmRleC5odG3UGFcIAAAAO3RFWHRDb3B5cmlnaHQAaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbGljZW5zZXMvYnktbmMtc2EvMi4wL2yIkoMAAAQlSURBVHja7ZxbiE1RGMcX4zouw5gLhpFQpiaXESZKuYsXnkxRkktII7nLwxQvLkU8kDy45QEx08SI0SCETK5RJuM2bg8SMcy4jO/rfLtZs87e5+xzm7PK/1f/mrP32nvq/5+911rfWmeUAgAAAAAAAAAQKZNJP2CDPewiNZHSYYUdVEkg02BF8skiNUoge2FH8lknYbA+kTrBkuTRkfRCC4S1ErYkj41GGKwPpO6wpvXpQ/rqEghrH+xpXdqSKj3CYP0lTYJNrcfmEGE4ek/qDasSzxTSLx+BsG6ROsOyxJFP+mKYfod0Vn7+TbponC+VVxyIMwNIrzWj2fxNYvYyOfZdPm8gNWhtD5LawML4MYj0SjOYf56onV+unXP6jWGkau34MVI7WBk7I0lvxVT+q99B6mq0uaAZP187zgGslyeHz5VjjhIb80j1YuZp0mCXNnOMPqPS43VXJudrSMNhbWT0Ih0VAy+Txni0S5fhrTm6KvRoP4v0VAXWTkowAvNHBqmOdN3oJ9w4EWK469WJp5AWkh6oQB0sFZaHp72PNovDzEFW+7gHKsNxYoS8dkIF8pM0ClYlnhzSG58z9ZekTFiWONJI932GgfJJK4RxO8IwHFWQOsDC+I683MLgfqTUOHaI9NmlbZnPwQLwUTZ5ZpjLa+fbSNnSRu/IlfQbB1RwVfgMRlaxMVPMdwytJRWTumhtUg3Ts7VzQ0iHjWBuoqOPHN68sF0FVv7YxLukuTKpM5ltBLLIo3SyWzUv+T4njYbN/hhHeiLGnQ8zW+dSe7URyGOP4JjuMmGsladmKzp7b3KlFNIgr5l8H9es9RhVFYe5joPkouQ1mauskKcSaKxSgdJ6js/2harlIpQuLrfn+bxPAem49DcgSvor9yqvLq7q9oBViacn6ZHPCWEVhrmJhVcKb0Q4Sy/HhDAx8HzjapSlk3N4UuJLN9X8HRC3XYr65z8hXl9psDJ2MmVi6FbH4lFZunGcw1ujmtfidfEqYT9YGj0FMk8wn4AjMm9xcM41ascGkk65hPIOs/ToSidbVPCqYLnHhNE5/81jvlKhglcTl8Dm8PA+qqWq5Q7FJunMx4e4LlQg+tN2VMJw2p9U+KKoJ1zKqFHB+3an+7hWn6GHI0tKLg/lmo8qsLkOW02Fvi6vFF6MmhXBPZzr6iP83bxhbqcKrNHfIxWp/7ymxXODOs3QS6SpUdxHH3lFAz8dE0j75Y/jv2aPCqz+DY3hHm6jLJBE9CExsCiQJnTO9gWCFUDLAukKO+wKJAN22BVILuywK5A82GFXIGNhh12BzIAddgWyAHbYFUgJ7LArkCuww65AWEWwxK5AeFcjdi0mEV5X4e+F8MYG/l8nKbAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABs5B9uiddeB7PCXwAAAABJRU5ErkJggg=="
}