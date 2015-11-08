require 'test_helper'

class CartTest < ActiveSupport::TestCase
	fixtures :carts
	fixtures :products

	test "adding product adds to cart" do 
		cart = Cart.new
		before_save = cart.line_items.count
		line_item = cart.add_product(products(:ruby).id, products(:ruby).price).save!
		#cart.save!
		after_save = cart.line_items.count
		assert_equal after_save, before_save+1	
		assert_equal cart.total_price, cart.line_items.first.quantity * cart.line_items.first.price
	end 
end
