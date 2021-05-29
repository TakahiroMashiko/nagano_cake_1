class RenameShippingPostalCodeColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :shipping_postal_code, :postal_code
  end
end
