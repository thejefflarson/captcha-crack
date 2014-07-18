100.times do |i|
  `curl https://tender.me.gov.ua/EDZFrontOffice/SimpleCaptcha.jpg > test/#{i}.jpg`
  `convert test/#{i}.jpg test/#{i}.png`
  `rm test/#{i}.jpg`
end