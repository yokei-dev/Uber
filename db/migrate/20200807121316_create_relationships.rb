class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :driver, foreign_key: true, null: false
      t.integer :cost

      t.timestamps
    end
  end
end
