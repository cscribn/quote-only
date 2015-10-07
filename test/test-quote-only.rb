require 'minitest/autorun'
require 'quote-only'

class QuoteOnlyTest < Minitest::Test
	def test_
		cnn_market_tests = []
		cnn_market_tests.push({ :symbol => 'dow', :friendly_name => 'Dow', :decimal_places => -3 })
		cnn_market_tests.push({ :symbol => 'sandp', :friendly_name => 'S&P', :decimal_places => -2 })

		cnn_market_tests.each do |c|
			f = CnnMarketQuoteOnly.new(c)
			puts f
			assert f.quote.is_a? Float
		end

		f = CnnQuoteOnly.new({ :symbol => 'XBT', :friendly_name => 'Bitcoin', :decimal_places => -1 })
		puts f
		assert f.quote.is_a? Float

		f = BloombergQuoteOnly.new({ :symbol => 'USGG10YR:IND', :friendly_name => '10 Year', :decimal_places => 0 })
		puts f
		assert f.quote.is_a? Float

		f = ApmexGoldQuoteOnly.new({ :symbol => 'oz', :friendly_name => 'Gold', :decimal_places => -2 })
		puts f
		assert f.quote.is_a? Float

		f = ApmexSilverQuoteOnly.new({ :symbol => 'oz', :friendly_name => 'Silver', :decimal_places => 0 })
		puts f
		assert f.quote.is_a? Float
	end
end