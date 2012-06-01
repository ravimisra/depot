class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	
	def add_product(product_id)
		current_item  = line_items.where(:product_id => product_id).first
		if current_item
			current_item.quantity += 1
		else
			current_item = LineItem.new(:product_id=>product_id)
			# capture the price whenever a new line item is created.
			current_item.price = current_item.product.price
			line_items << current_item
		end
		current_item
	end
	
	def total_price
		line_items.to_a.sum{|item| item.total_price}
	end
	
	def decrease(line_item_id)
		current_item = line_items.find(line_item_id)
		if current_item.quantity > 1
			current_item.quantity -= 1
		else
			current_item.destroy
		end
		current_item
	end

	def increase(line_item_id)
		current_item = line_items.find(line_item_id)
		current_item.quantity += 1
		current_item
	end	
end
