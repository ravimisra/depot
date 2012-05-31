class AddPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :decimal ,:precision => 8, :scale => 2
	
	LineItem.all.each do |line_item|
		current_product = Product.find(line_item.product_id)
		line_item.update_attribute(:price, current_product.price)
	end

  end
end
