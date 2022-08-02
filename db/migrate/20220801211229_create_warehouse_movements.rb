class CreateWarehouseMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_movements do |t|
      t.integer :supply_id
      t.integer :course_id
      t.string :exit_date, default: ""
      t.string :return_date, default: ""
      t.integer :exit_quantity, default: 0
      t.integer :return_quantity, default: 0
      t.string :supervisor, default: ""

      t.timestamps
    end
  end
end
