class RenameCuttomerIdColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :cuttomer_id, :customer_id
  end
end
