class CreateDeliveryRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_requests do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :departure, null: false
      t.string :destination, null: false
      t.integer :cost, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
