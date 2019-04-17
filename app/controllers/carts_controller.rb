class CartsController < ApplicationController

  def show
  end

  def add_item
    # puts ">>> HJ: #{params}"
    # quantityRemain = params[:product_quantity]
    # quantityOrder = params[:order_quantity]
    # if quantityOrder > quantityRemain
    #   puts ">>> HJ: Not enough quantity! #{quantityOrder} > #{quantityRemain}"
    # else
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)
    # end
    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)
    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
