require 'bundler/setup'
require 'oily_png'

right = 0
wrong = 0

Dir[File.join(__dir__, "test", "*")].each do |f|
  img = ChunkyPNG::Image.from_file f
  data = img.pixels.map {|p| ((p & 0xff000000) >> 24) > 60 ? 1 : 0 }.join(' ')
  res = `echo #{data} | ./tn`
  arr = res.split(" ").map {|i| i.to_f.round.to_i }.join(' ')
  txt = File.basename(f, '.png').split('').slice(3, 5).join(' ')
  puts "#{arr} #{txt}"
  arr == txt ? right += 1 : wrong += 1
end

p right, wrong