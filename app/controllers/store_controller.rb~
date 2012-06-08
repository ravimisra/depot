class StoreController < ApplicationController
  def index
	increment_counter
	@products = Product.all
	@cart = current_cart
  end
end
