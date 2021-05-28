class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit, :update, :withdrawal, :quit]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    if @customer.update(customer_params)

    else

    end
  end

  def update
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
  end

  def quit
    @customer = current_customer
  end

  # Strong parameters
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
