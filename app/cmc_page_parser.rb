require 'nokogiri'
require 'date'
require 'open-uri'

class CmcPageParser
  def self.parse(identifier)
    url = "https://coinmarketcap.com/currencies/#{identifier}/historical-data/?start=20130428&end=20171020"
    source = open(url).read
    parse_from_html(source)
  end

  def self.parse_from_html(html)
    parsed_obj = {}
    page = Nokogiri::HTML(html)
    parsed_obj[:date_added] = Date.parse(page.css('.text-left').last.content)
    parsed_obj
  end
end