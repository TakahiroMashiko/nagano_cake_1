class AddLastNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :lastname, :string
  end
end
