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
  end

  def withdrawal
    @customer = current_customer
  end

  def quit
    @customer = current_customer
  end

  private

end
