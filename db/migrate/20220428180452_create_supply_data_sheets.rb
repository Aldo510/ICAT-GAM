class CreateSupplyDataSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :supply_data_sheets do |t|
      t.integer :data_sheet_id
      t.string :name
      t.integer :quantity

      t.timestamps
    end
  end
end
