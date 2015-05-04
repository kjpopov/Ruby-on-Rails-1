class Tweet

require 'net/http'

def self.authenticate
	uri = URI('https://api.twitter.com/oauth/authenticate')
  Net::HTTP.get(uri) # => String
end

end