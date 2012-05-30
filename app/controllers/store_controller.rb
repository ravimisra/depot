class StoreController < ApplicationController
  def index
	increment_counter
	@products = Product.all
  end
end
