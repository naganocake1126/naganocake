class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @orders = current_customer.cart_items
    @customer = Customer.find(current_customer.id)

  end

  def conflrmation
   @order = Order.new(order_params)
   @order.postal_code = current_customer.postal_code
   @order.address = current_customer.address
   @order.name = current_customer.first_name + current_customer.last_name
   @cart_items = current_customer.cart_items
   @total = 0
  end
  def complete
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
  end

  def index
    @orders = current_customer.order.find(params[:id])

  end

  def show
   @orders = current_customer.orders.find(params[:id])
  end

  private
def order_params
  params.require(:order).permit(:payment, :address)
end

end