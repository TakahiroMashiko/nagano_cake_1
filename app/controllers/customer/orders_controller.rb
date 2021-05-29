class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @cart_item = current_customer.cart_items

    if params[:order][:addresses] == "address"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address

    elsif params[:order][:addresses] == "addresses"
      addresses = Address.find(params[:order][:addresses_id])
      @order.name = addresses.name
      @order.postal_code = addresses.postal_code
      @order.address = addresses.address
    elsif params[:order][:addresses] == "new_address"
      if params[:order][:postal_code] != "" && params[:order][:address] != "" && params[:order][:name] != ""
        @order.name = params[:order][:name]
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @addresses = "1"
      else
      flash[:danger] = "新しいお届け先が入力されていません"
      redirect_to new_order_path
      end

      current_customer.cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      @order = Order.new
      @addresses = current_customer.addresses
      render 'new'
    end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    # @order.status = 0

    if @order.save
      flash[:success] = "ご注文が確定しました"
      # current_customer.cart_items.each do |cart_item|
      #   # order_item = OrderItem.new
      #   # order_item.amount = cart_item.amount
      #   # order_item.price = cart_item.item.price
      #   # order_item.order_id = @order.id
      #   # order_item.item_id = cart_item.item_id
      #   # order_item.save
      # end

      if params[:order][:addresses] == "1"
        current_customer.addresses.create(address_params)
      end
    end
  end

  def index
    @orders = current_customer.orders
    @orders = Order.where(customer_id: current_customer.id).order("created_at DESC")
  end

  def show
    @order=Order.find(params[:id])
    # @order_items = @order.order_items
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