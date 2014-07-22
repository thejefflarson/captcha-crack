require 'bundler/setup'
require 'oily_png'

img = ChunkyPNG::Image.from_file ARGV[0]
img.crop! 20, 6, 105, 35
img.pixels.map! {|p| ((p & 0xff000000) >> 24) < 60 ? 1 : 0 }.join(' ')
arr = []
offsets = [0, 24, 43, 62, 83, 105]

(offsets.length - 1).times do |i|
  im = img.crop(offsets[i], 0,  offsets[i + 1] - offsets[i], 35)
  im.resample_nearest_neighbor! 16, 16
  data = im.pixels.join(' ')
  res = `echo #{data} | ./tn #{ARGV[1]}`

  a = res.split(" ").map(&:to_f)
  arr.push(a.index(a.max))
end

puts arr.join('')