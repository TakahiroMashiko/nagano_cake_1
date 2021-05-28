class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @cart_item = current_customer.cart_items

      if params[:order][:addresses] == "address"
        @order.name = full_name(customer)
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
      else

      end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
  end

  def index
    @orders = current_customer.orders
    @orders = Order.where(customer_id: current_customer.id).order("created_at DESC")
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
