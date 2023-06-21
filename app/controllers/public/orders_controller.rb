class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @orders = current_customer.cart_items
    @customer = Customer.find(current_customer.id)

  end

  def conflrmation
   @order = Order.new(order_params)
   if params[:order][:address_option] == "0"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.first_name + current_customer.last_name
   end
   @subtotal = 0
   @cart_items = current_customer.cart_items
   @cart_items.each do |cart_item|
     @subtotal += cart_item.subtotal
   end
   @sipping_cost = 800
   @total_all = @sipping_cost + @subtotal
   @total = @subtotal
  end


  def complete
  end

  def create

    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart|
        order_details = OrderDetail.new
        order_details.item_id = cart.item_id
        order_details.order_id = @order.id
        order_details.amount = cart.amount
        order_details.price = cart.item.price
        order_details.save
      end
     redirect_to orders_complete_path(@order.id)
     @cart_items.destroy_all
    else
     @order = Order.new(order_params)
     render :new
    end
  end

  def index
    @orders = current_customer.orders.all
    @cart_items = current_customer.cart_items
    @item = current_customer.orders

  end

  def show
   @order = Order.find(params[:id])
   @subtotal = 0
   @sipping_cost = 800
  end

  def update
  end

  private
def order_params
  params.require(:order).permit(:payment_method, :address, :customer_id, :postal_code, :name, :shipping_cost, :total_payment)
end

end