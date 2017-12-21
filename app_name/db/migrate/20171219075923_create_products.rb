class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :product_id, null: false, unique: true
      t.string :name, null: false
      t.integer :price, null: false
      t.timestamps
    end
    add_index :products, [:product_id], unique: true
  end
end
