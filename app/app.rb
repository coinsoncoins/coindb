
require 'json'
require 'pry'
file = File.read('data/cmc.json')
data = JSON.parse(file)

File.open("db/db.json","w") do |f|
  f.write(JSON.pretty_generate(data))
end