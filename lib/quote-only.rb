require 'nokogiri'
require 'open-uri'

class QuoteOnly
	attr_accessor :css, :url, :symbol, :friendly_name, :quote

	def initialize(options)
		@symbol = options[:symbol]
		@friendly_name = options[:friendly_name]
		@decimal_places = options[:decimal_places]
	end

	def match
		page = Nokogiri::HTML(open(@url))
		@quote = page.css(@css).text.gsub(/[$,]/, '').to_f
	end

	def to_s
		decimal_places_string = '0'

		if(@decimal_places > 0)
			decimal_places_string = @decimal_places.to_s
		end

		quote_rounded = ('%.' + decimal_places_string + 'f') % @quote.round(@decimal_places)
		s = @friendly_name + ' (' + @symbol + ') ' + quote_rounded.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
	end
end

class CnnMarketQuoteOnly < QuoteOnly
	def initialize(options)
		super(options)
		@css = 'td.wsod_lastIndex > span'
		@url = 'http://money.cnn.com/data/markets/' + @symbol + '/'
		match()
	end
end

class CnnQuoteOnly < QuoteOnly
	def initialize(options)
		super(options)
		@css = 'td.wsod_last > span'
		@url = 'http://money.cnn.com/quote/quote.html?symb=' + @symbol
		match()
	end
end

class BloombergQuoteOnly < QuoteOnly
	def initialize(options)
		super(options)
		@css = 'div.price-container > div.price'
		@url = 'http://www.bloomberg.com/quote/' + @symbol
		match()
	end
end

class ApmexGoldQuoteOnly < QuoteOnly
	def initialize(options)
		super(options)
		@css = 'table.table-spot-prices > tbody > tr:nth-child(1) > td:nth-child(2) > span'
		@url = 'http://www.apmex.com'
		match()
	end

	def match
		super
		css_text_match = /(\d+\.\d+)/.match(@quote.to_s)
		@quote = css_text_match[1].to_f
	end
end

class ApmexSilverQuoteOnly < QuoteOnly
	def initialize(options)
		super(options)
		@css = 'table.table-spot-prices > tbody > tr:nth-child(2) > td:nth-child(2) > span'
		@url = 'http://www.apmex.com'
		match()
	end

	def match
		super
		css_text_match = /(\d+\.\d+)/.match(@quote.to_s)
		@quote = css_text_match[1].to_f
	end
end