class Admin::HomesController < ApplicationController
  # kaminari実装後に「.page(params[:page]).per(10)」を記載
  def top
    @orders = Order.all
  end
end