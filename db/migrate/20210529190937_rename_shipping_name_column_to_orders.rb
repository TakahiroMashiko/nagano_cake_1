class RenameShippingNameColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :shipping_name, :name
  end
end
