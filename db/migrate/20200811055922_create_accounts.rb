class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.references :customer, foreign_key: true
      t.references :driver, foreign_key: true
      # t.references :delivery_request, foreign_key: true, null: false
      t.integer :state, null: false
      t.integer :got
      t.integer :lost
      t.timestamps
    end
  end
end
