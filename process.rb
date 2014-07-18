require 'bundler/setup'
require 'oily_png'
files = Dir[File.join(__dir__, "out", "*.png")]
out = File.open('out.dat', 'w')
out.puts [files.length * 5, (16 * 16), 10].join(' ')

Dir[File.join(__dir__, "out", "*.png")].each do |f|
  img = ChunkyPNG::Image.from_file f
  txt = File.basename f, '.png'
  img.crop! 20, 6, 105, 35
  offsets = [0, 24, 43, 62, 83, 105]
  img.pixels.map! {|p| ((p & 0xff000000) >> 24) < 60 ? 1 : 0 }

  digits = txt.split('').map(&:to_i)
  (offsets.length - 1).times do |i|
    im = img.crop(offsets[i], 0,  offsets[i + 1] - offsets[i], 35)
    im.resample_nearest_neighbor! 16, 16
    out.puts im.pixels.join(' ')
    out.puts 10.times.map {|idx| digits[i].to_i == idx ? 1 : 0}.join(' ')
  end
end
