class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customers_params)
    flash[:notice] = "You have updated customer successfully."
     redirect_to admin_admin_path
    else
     render "edit"
    end
  end

  
  
end
