require 'bundler/setup'
require 'oily_png'

right = 0
wrong = 0

Dir[File.join(__dir__, "test", "*")].each do |f|
  img = ChunkyPNG::Image.from_file f
  img.crop! 20, 6, 95, 35
  data = img.pixels.map {|p| ((p & 0xff000000) >> 24) < 60 ? 1 : 0 }.join(' ')
  res = `echo #{data} | ./tn`
  p res
  arr = res.split(" ").map(&:to_f).each_slice(10).map {|i| i.index(i.max) }.to_a.join(' ')
  txt = File.basename(f, '.png').split('').join(' ')
  puts "#{arr} #{txt}"
  arr == txt ? right += 1 : wrong += 1
end

p right, wrong