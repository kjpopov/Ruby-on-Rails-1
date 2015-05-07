class Tweet

def self.prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new("IlMQjLkxdEJdfCSKXTYZxxLGA", "6F5N7TYScVrLOprHMaBm7dRSyTYW3GuDI4r021fCe9smurtdgN", { :site => "https://api.twitter.com", :scheme => :header })
     
    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
 
    return access_token
end

#def self.get_tweets
# access_token = prepare_access_token("3233708379-rwLC41307Lw6eiLyzduLpSONbtnOn01ejqlTtVu", "4HlNXHXcuxKA03FGEy0uWbRr2EQH38rAcTllwzRLAL1KT")
# response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
# return response.body
#end

def self.get_tweets
  file = File.read('tweets_data.json')
  tweets_hash = JSON.parse(file)
  return tweets_hash
end

end