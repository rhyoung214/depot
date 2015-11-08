class StoreController < ApplicationController
  include CurrentCart
  def index
  	@count = increment_counter
  	@products = Product.order(:title)
  	#@cart = current_cart
  	@counter_message = "You've been here #{@count} times" if @count > 5
  	set_time
  end

  def set_time
  	@time_display = Time.now.strftime("%a %b %e %r %Y")
  	return @time_display
  end
end
