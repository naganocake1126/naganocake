class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end
   


  def edit
    @customer = current_customer

  end

  def quit
  end

  def leave
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_customer_session_path
  end


  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number)
  end


end