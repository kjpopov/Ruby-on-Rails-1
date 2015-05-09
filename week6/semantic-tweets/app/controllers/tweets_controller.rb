class TweetsController < ApplicationController

def index
	# render json: Tweet.get_tweets
end

def new
	@api_data = JSON.parse(Tweetsfromapi.storein_json)
end

def analize

end

end