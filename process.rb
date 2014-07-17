require 'bundler/setup'
require 'oily_png'
files = Dir[File.join(__dir__, "out", "*")]
out = File.open('out.dat', 'w')
out.puts [files.length, (40 * 40), 2].join(' ')

Dir[File.join(__dir__, "out", "*")].each do |f|
  img = ChunkyPNG::Image.from_file f
  txt = File.basename f, '.png'
  out.puts img.pixels.map {|p| ((p & 0xff000000) >> 24) > 60 ? 1 : 0 }.join(' ')
  out.puts txt.split('').slice(3, 5).map{|i| i.to_f / 10 }.join(' ')
end
