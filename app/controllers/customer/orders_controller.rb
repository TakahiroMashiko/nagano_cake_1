class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end
end
