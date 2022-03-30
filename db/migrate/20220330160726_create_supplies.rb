class CreateSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :supplies do |t|
      t.integer :shelf_section_id
      t.text :name
      t.text :description
      t.text :identification_code
      t.integer :quantity
      t.boolean :perishable

      t.timestamps
    end
  end
end
