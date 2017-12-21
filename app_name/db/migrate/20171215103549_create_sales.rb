class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :product_id, null: false
      t.integer :month, null: false
      t.integer :num, null: false
      t.timestamps
    end
  end
end
