class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_item = CartItem.where(customer_id: current_customer.id).order("created_at DESC")
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_items = CartItem.where(customer_id: current_customer.id).order("created_at DESC")
    if @cart_item.update(cart_item_params)
      flash[:success] = "個数を変更しました"
      redirect_to cart_items_path
    else
      flash[:danger] = "正しい個数を入力してください"
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_items = CartItem.where(customer_id: current_customer.id).order("created_at DESC")
    @cart_item.destroy
      flash[:success] = "選択した商品を削除しました"
      redirect_to cart_items_path
  end

  def all_delete
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
      flash[:success] = "カートが空になりました"
      redirect_to cart_items_path
  end

  def create
    @cart_items = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
    if @cart_items.present?
      @cart_items.amount += params[:cart_item][:amount].to_i
      @cart_items.save
        flash[:success] = "カートに追加しました"
        redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        flash[:success] = "カートに追加しました"
        redirect_to cart_items_path
      else
        flash[:danger] = "個数を入力してください"
        redirect_to item_path(@cart_item.item)
      end
    end
  end

  # Strong parameters
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
