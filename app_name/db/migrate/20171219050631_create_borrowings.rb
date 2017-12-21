class CreateBorrowings < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowings do |t|
      t.integer :user
      t.integer :book
      t.date :due_back

      t.timestamps
    end
  end
end
