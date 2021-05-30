class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :image

  validates :introduction, length: {maximum: 200}
  validates :price, numericality: { only_integer: true }
end
