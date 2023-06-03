class Admin::ItemsController < ApplicationController

  def index
    @item = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.save!
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  

  end

  def edit
    @item = Item.find(params[:id])
 
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(items_params)
     flash[:notice] = "You have updated item successfully."
     redirect_to admin_item_path(@item.id)
    else
      render "edit"
    end
  end





  private
  def items_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
