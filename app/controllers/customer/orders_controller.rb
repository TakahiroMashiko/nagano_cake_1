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
    @orders = current_customer.orders
  end

  def show
    @order=Order.find(params[:id])
    @order_items = @order.order_items
  end

  # Strong parameters
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment )
  end

  def address_params
    params.require(:order).permit(:name, :postal_code, :address)
  end
end
