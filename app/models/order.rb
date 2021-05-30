class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  # accepts_nested_attributes_for :order_details

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }

  validates :customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, presence: true
  validates :postal_code, presence: true, length: {is: 7}, numericality: { only_integer: true }
  validates :shipping_cost, :total_payment, numericality: { only_integer: true }
end