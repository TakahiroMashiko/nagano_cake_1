class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def update
    @order = order.find(params[:id])
    if @order.update(order_params)

    end
  end
end
