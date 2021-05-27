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
  end

  def create
  end

  # Strong parameters
  private
  def cart_item_param
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
