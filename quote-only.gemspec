Gem::Specification.new do |s|
  s.name        = 'quote-only'
  s.version     = '1.0.3'
  s.date        = '2016-03-16'
  s.summary     = 'Get only the quote for assets in your portfolio, without daily change.'
  s.description = 'Most finincial websites show the daily change of a financial asset, along with its quote.  This can be distracting to long-term investors attempting to "stay the course".  The purpose of this gem is to provide only the quote.  Markets and quotes are supported via money.com.  Treasuries are supported via bloomberg.com.  Precious Metals are supported using apmex.com.'
  s.authors     = ['cscribn']
  s.files       = ['lib/quote-only.rb', 'test/test-quote-only.rb']
  s.homepage    =
    'http://rubygems.org/gems/quote-only'
  s.license       = 'MIT'
	s.add_development_dependency 'minitest', '~> 0'
	s.add_runtime_dependency 'nokogiri'	, '~> 0'
end