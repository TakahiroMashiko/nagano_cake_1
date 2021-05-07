class Admin::HomesController < ApplicationController
  def top
    now = Time.current
    @orders = order.where(created_at: now.all_day)
  end
end