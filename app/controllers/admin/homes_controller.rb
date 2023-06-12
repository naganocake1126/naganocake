class Admin::HomesController < ApplicationController

 def top
  @orders = Order.all
  @order = Order.page(params[:page])
 end



end