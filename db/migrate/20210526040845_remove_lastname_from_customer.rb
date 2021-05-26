class RemoveLastnameFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :lastname, :integer
  end
end
