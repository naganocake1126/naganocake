class Admin::HomesController < ApplicationController
  
 def top
  @orders = current_customer.order.find(params[:id])
  @orders = Order.page(params[:page])
 end

end
