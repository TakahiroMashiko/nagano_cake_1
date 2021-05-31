class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit, :update, :withdrawal, :quit]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "会員情報を更新しました"
      redirect_to customers_path
    else
      render 'edit'
    end
  end

  def withdrawal
    @customer = current_customer
  end

  def quit
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:success] = "退会処理しました。ご利用いただきありがとうございました。"
    redirect_to root_path
  end

  # Strong parameters
  private
  def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end