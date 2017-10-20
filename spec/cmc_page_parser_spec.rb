
require './app/cmc_page_parser'

RSpec.describe CmcPageParser do
  context "#parse_from_html" do
    it "parses" do
      parsed = CmcPageParser.parse_from_html(open('./spec/data/cmc_metal.html'))
      expect(parsed[:date_added]).to eq(Date.parse("Jul 09, 2017"))
    end
  end
end