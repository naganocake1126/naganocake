class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def update
  end

  def destroy
    cart_item = CartItem.fiud(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
     render 'index'
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
     render 'inde'
  end

  def create
    binding.pry
    @cart_items = current_customer.cart_item.new(cart_item_params)

  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
