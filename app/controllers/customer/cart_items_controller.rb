class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_item = CartItem.where(customer_id: current_customer.id).order("created_at DESC")
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_items = CartItem.where(customer_id: current_customer.id).order("created_at DESC")
    if @cart_item.update(cart_item_params)
      render :index
    else
      flash[:danger] = "正しい個数を入力してください"
      render :index
    end
  end

  def delete
    @cart_item = CartItem.find(params[:id])
    @cart_items = CartItem.where(customer_id: current_customer.id).order("created_at DESC")
    @cart_item.destroy
      flash[:success] = "選択した商品を削除しました"
      render :index
  end

  def all_delete
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
      flash[:success] = "カートが空になりました"
      render :index
  end

  def create
    @cart_items = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
    if @cart_items.present?
      @cart_items.number += params[:cart_item][:number].to_i
    else

    end
  end

  # Strong parameters
  private
  def cart_item_param
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
