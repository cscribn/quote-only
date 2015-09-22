Gem::Specification.new do |s|
  s.name        = 'quote-only'
  s.version     = '0.1.0'
  s.date        = '2015-09-21'
  s.summary     = 'Get only the quote for assets in your portfolio, without daily change.'
  s.description = 'Most finincial websites show the daily change of a financial asset, along with its quote.  This can be distracting to long-term investors attempting to "stay the course".  The purpose of this gem is to provide only the quote.  Markets are supported via money.com.  Treasuries are supported via Bloomberg.  Precious Metals are supported using apmex.com.'
  s.authors     = ['cscribn']
  s.files       = ['lib/quote-only.rb', 'test/test-quote-only.rb']
  s.homepage    =
    'http://rubygems.org/gems/quote-only'
  s.license       = 'MIT'
end