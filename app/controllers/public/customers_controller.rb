class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
    
  end
  
  def update
  end
  
  def quit
  end
  
  def leave
  end
  
