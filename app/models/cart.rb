class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id, product_price) # method name that takes in  "product_id" & "product_price" variable
		current_item = line_items.find_by(product_id: product_id) # assigns current_item to value of line item if found based on the product_id
		if current_item # only runs if true
			current_item.quantity += 1 # adds 1 to the quantity of itself
		else # if current item returns nil in line 5
			current_item = line_items.build(product_id: product_id, price: product_price) # builds a relationship between the LI and the product
		end
		current_item # returns current items
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end
