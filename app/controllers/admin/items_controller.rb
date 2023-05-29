class Admin::ItemsController < ApplicationController

  def index
    @item = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.save
    redirect_to admin_items_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def edit
  end

  def update
  end





  private
  def items_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
