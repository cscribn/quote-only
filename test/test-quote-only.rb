require 'minitest/autorun'
require_relative '../lib/quote-only'

class QuoteOnlyTest < Minitest::Test
    def testCnnQuoteOnly(symbol, friendly_name, decimal_places)
        f = CnnQuoteOnly.new({ :symbol => symbol, :friendly_name => friendly_name, :decimal_places => decimal_places })
        puts f
        assert f.quote.is_a? Float
    end

    def test_
        testCnnQuoteOnly('VT', 'World Stocks', 2)

        f = ApmexGoldQuoteOnly.new({ :symbol => 'oz', :friendly_name => 'Gold', :decimal_places => 2 })
        puts f
        assert f.quote.is_a? Float

        f = ApmexSilverQuoteOnly.new({ :symbol => 'oz', :friendly_name => 'Silver', :decimal_places => 2 })
        puts f
        assert f.quote.is_a? Float
        puts

        testCnnQuoteOnly('VTI', 'U.S. Stocks', 2)
        testCnnQuoteOnly('VT', 'Foreign Stocks', 2)
        puts

        testCnnQuoteOnly('VGLT', 'Long-Term Gov', 2)
        f = BloombergQuoteOnly.new({ :symbol => 'USGG10YR:IND', :friendly_name => '10 Year', :decimal_places => 2 })
        puts f
        assert f.quote.is_a? Float
        puts

        testCnnQuoteOnly('BWZ', 'Foreign Cash', 2)
        puts
    end
end