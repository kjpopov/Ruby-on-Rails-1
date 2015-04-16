class ProductController < ApplicationController
DATA = {:info => [{:from => "Ryan Bates", :message => "sup bra", :time => "04:35 AM"}]}
  def count
  render json: DATA.to_json
  end
end
