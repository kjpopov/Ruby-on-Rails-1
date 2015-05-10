class TweetsController < ApplicationController

def index
	@semantria_results = JSON.parse(File.read("semantria_results_data.json"))
end

def new
	@api_data = JSON.parse(Tweetsfromapi.storein_json)
end

def analize
  @session = SemantApi.new_session
  
  @queued_success = SemantApi.prepare_doc(@session)

  @results = SemantApi.get_results(@session, @queued_success.length)
end

end