class BrandsController < ApplicationController

  def count
    render json: PRODUCTS.count.to_json
  end

  def index
  	render json: PRODUCTS.to_json
  end

end
