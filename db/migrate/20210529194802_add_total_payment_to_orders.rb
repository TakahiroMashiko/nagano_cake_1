class AddTotalPaymentToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total_payment, :integer
  end
end
