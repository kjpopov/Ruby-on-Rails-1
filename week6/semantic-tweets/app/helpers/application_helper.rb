module ApplicationHelper
	def is_active?(page_name)
  "active" if params[:action] == page_name
  end
  
  def is_positive?(data)
  data['source_text'] if data['sentiment_polarity'] == "positive"
  end

end
