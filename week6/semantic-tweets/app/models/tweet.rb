class Tweet

def self.get_tweets
  file = File.read('tweets_data.json')
  tweets_hash = JSON.parse(file)
  return tweets_hash
end

end