class Tweet

require 'net/http'

Net::HTTP.get('tweeter.com', '/bob') # => String

end