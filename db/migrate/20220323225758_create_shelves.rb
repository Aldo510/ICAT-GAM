class CreateShelves < ActiveRecord::Migration[7.0]
  def change
    create_table :shelves do |t|
      t.references :warehouse, null: false, foreign_key: true
      t.string :code
      t.string :category

      t.timestamps
    end
  end
end
