class AddNameToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :name, :string, null: false, default: ""
  end
end
