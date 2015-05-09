class TweetsController < ApplicationController

def index
	# render json: Tweet.get_tweets
end

def new
	render json: Tweetsfromapi.storein_json
end

end