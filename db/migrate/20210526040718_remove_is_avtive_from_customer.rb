class RemoveIsAvtiveFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :is_avtive, :boolean
  end
end
