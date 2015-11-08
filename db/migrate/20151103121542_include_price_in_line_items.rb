class IncludePriceInLineItems < ActiveRecord::Migration
  def up

  	LineItem.all.each do |lineitem|

  		prod_price = Product.find_by(id: lineitem[:product_id]).price
  		lineitem.price = li.product.prod_price if li.price
  		lineitem.save!
  	end
  end

  def down
  	LineItem.all.each do |line_item|
  		line_item[price: nil] if line_item.price != nil
      remove_column :line_items, :price
  	end
  end
end
