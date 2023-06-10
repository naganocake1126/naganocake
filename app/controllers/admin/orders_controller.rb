class Admin::OrdersController < ApplicationController
  
  def show
    @order = current_customer.orders.find(params[:id])
  end
  
end
