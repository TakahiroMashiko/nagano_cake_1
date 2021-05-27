class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true }
end
