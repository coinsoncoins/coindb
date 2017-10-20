
require 'date'

class Queries
  def initialize(cryptos)
    @cryptos = cryptos
  end

  def cryptos_listed_by_month(date)
    filtered_cryptos = @cryptos.select do |coin| 
      if coin['date_added']
        Date.parse(coin['date_added']).month == date.month 
      end
    end
    filtered_cryptos.sort_by! { |c| Date.parse(c['date_added']).day }
    filtered_cryptos
  end
end


if __FILE__ == $0
  require 'json'
  file = File.read('db/db.json')
  cryptos = JSON.parse(file)
  q = Queries.new(cryptos)
  filtered_cryptos = q.cryptos_listed_by_month(Date.parse("2017/08/01"))
  filtered_cryptos.each do |c|
    puts "#{c['id']}: #{c['date_added']}"
  end
end


