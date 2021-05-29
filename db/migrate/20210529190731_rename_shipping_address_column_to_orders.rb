class RenameShippingAddressColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :shipping_address, :address
  end
end
