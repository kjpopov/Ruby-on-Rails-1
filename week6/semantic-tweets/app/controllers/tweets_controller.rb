class TweetsController < ApplicationController

def index
	render json: Tweet.get_tw
end

end