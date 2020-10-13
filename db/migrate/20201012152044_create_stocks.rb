class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :books_stocked, null: false, default: 0
      t.integer :books_sold, null: false, default: 0

      t.timestamps
    end
    add_index :stocks, %i[shop_id book_id], unique: true
  end
end
