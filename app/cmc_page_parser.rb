require 'nokogiri'
require 'date'
class CmcPageParser
  def self.parse(filename)
    parsed_obj = {}
    page = Nokogiri::HTML(open(filename))
    parsed_obj[:date_added] = Date.parse(page.css('.text-left').last.content)
    parsed_obj
  end
end