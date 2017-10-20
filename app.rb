
require 'json'
require 'pry'
file = File.read('data/cmc.json')
data = JSON.parse(file)
binding.pry