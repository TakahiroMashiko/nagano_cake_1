class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :customer_id, :item_id, :amount, presence: true
  validates :amount, numericality: { only_integer: true }

  def price_including_tax
    (item.price*1.10).round
  end

  def subtotal
    (item.price*1.10*amount).round
  end
end
