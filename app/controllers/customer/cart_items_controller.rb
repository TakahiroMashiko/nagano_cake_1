class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def update
  end

  def delete
  end

  def all_delete
  end

  def create
  end

  # Strong parameters
  private
  def cart_item_param

  end
end
