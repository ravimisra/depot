class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	
	def total_price
		#must be changed to only "price" but fails in functional test because the test db table line_items doesn't populated with product price
		product.price * quantity
	end
end
