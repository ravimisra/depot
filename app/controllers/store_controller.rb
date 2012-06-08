class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
	increment_counter
	@products = Product.all
	@cart = current_cart
  end
end
