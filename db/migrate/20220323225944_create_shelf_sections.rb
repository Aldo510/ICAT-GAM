class CreateShelfSections < ActiveRecord::Migration[7.0]
  def change
    create_table :shelf_sections do |t|
      t.references :shelf, null: false, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
