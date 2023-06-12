class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    
   
    @sipping_cost = 800

  end
  
  
  private
def order_params
  params.require(:order).permit(:payment_method, :address, :postal_code, :name, :shipping_cost, :total_payment)
end

end
