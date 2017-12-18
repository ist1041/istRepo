class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :product_id
      t.integer :month
      t.integer :num
      t.timestamps
    end
  end
end
