require 'bundler/setup'
require 'oily_png'
files = Dir[File.join(__dir__, "out", "*")]
out = File.open('out.dat', 'w')
out.puts [files.length * 5, (3325), 5 * 10].join(' ')

Dir[File.join(__dir__, "out", "*")].each do |f|
  img = ChunkyPNG::Image.from_file f
  txt = File.basename f, '.png'
  img.crop! 20, 6, 105, 35
  img.pixels.map! {|p| ((p & 0xff000000) >> 24) < 60 ? 255 : 0 }
  img.save('t.png')
  out.puts img.pixels.join(' ')
  out.puts(txt.split('').map do |i|
    10.times.map {|idx| i.to_i == idx ? 1 : 0}.join(' ')
  end.join(' '))
end
