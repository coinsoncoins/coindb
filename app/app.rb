
require 'json'
require 'pry'
require './app/cmc_page_parser'
file = File.read('db/db.json')
data = JSON.parse(file)

def write_to_file(data)
  File.open("db/db.json","w") do |f|
    f.write(JSON.pretty_generate(data))
  end
end


data.each do |coin|
  if coin["date_added"]
    puts "#{coin['id']} already has date_added"
  else
    puts "#{coin['id']} has no date added"
    parsed = CmcPageParser.parse(coin["id"])
    coin["date_added"] = parsed[:date_added]
    puts "#{coin['id']} has been added with date #{coin['date_added'].to_s}"
    write_to_file(data)
    sleep(1)
  end
end


