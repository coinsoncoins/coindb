
require 'date'

class Queries
  def initialize(cryptos)
    @cryptos = cryptos
  end

  def cryptos_listed_by_month(date)
    filtered_cryptos = @cryptos.select do |coin| 
      if coin['date_added']
        date_added = Date.parse(coin['date_added'])
        date_added.month == date.month && date_added.year == date.year
      end
    end
    filtered_cryptos.sort_by! { |c| c['market_cap_usd'].to_f }
    filtered_cryptos
  end
end


if __FILE__ == $0
  require 'json'
  file = File.read('db/db.json')
  cryptos = JSON.parse(file)
  q = Queries.new(cryptos)
  filtered_cryptos = q.cryptos_listed_by_month(Date.parse("2017/07/01"))
  filtered_cryptos.each do |c|
    puts "#{c['id']}: marketcap: #{c['market_cap_usd']}, date_added: #{c['date_added']}"
  end
end


