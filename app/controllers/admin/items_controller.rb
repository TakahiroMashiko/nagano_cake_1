class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_items_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  # Strong parameters
  private
  def item_params
    params.require(:item).permit(:genre_id, :image_id, :name, :introduction, :price, :is_active, :image)
  end
end
