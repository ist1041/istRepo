class AddProductIdFromTitles < ActiveRecord::Migration[5.1]
  def change
    add_column  :titles, :product_id,:integer
  end
end
