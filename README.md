# quote-only
Get only the quote for assets in your portfolio, without daily change.

Most finincial websites show the daily change of a financial asset, along with its quote.  This can be distracting to long-term investors attempting to "stay the course".  The purpose of this gem is to provide only the quote.  Markets and quotes are supported via money.com.  Treasuries are supported via bloomberg.com.  Precious Metals are supported using apmex.com.

# Installation
```ruby
gem install quote-only
```

# Usage
```ruby
require 'quote-only'

puts CnnMarketQuoteOnly.new({ :symbol => 'dow', :friendly_name => 'Dow', :decimal_places => 0 }).to_s
puts CnnQuoteOnly.new({ :symbol => 'XBT', :friendly_name => 'Bitcoin', :decimal_places => 0 }).to_s
puts BloombergQutoeOnly.new({ :symbol => 'USGG10YR:IND', :friendly_name => '10 Year', :decimal_places => 2 }).to_s
puts ApmexGoldQuoteOnly.new({ :symbol => 'Gold Spot', :friendly_name => 'Gold', :decimal_places => 0 }).to_s
puts ApmexSilverQuoteOnly.new({ :symbol => 'Silver Spot', :friendly_name => 'Silver', :decimal_places => 0 }).to_s
```
