class Public::ItemsController < ApplicationController

  
  def index
    @item = Item.page(params[:page])
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem.new
  end
  
 private
 
  def item_params
    params.require(:items).permit(:name,:introduction,:image,:price)
  end
  
end
