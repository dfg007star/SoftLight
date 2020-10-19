class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
    add_index :publisher, :publisher_id
  end
end
