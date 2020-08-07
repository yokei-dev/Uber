class AddNameToDriver < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :name, :string, null: false, default: ""
  end
end
