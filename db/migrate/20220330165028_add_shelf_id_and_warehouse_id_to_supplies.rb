class AddShelfIdAndWarehouseIdToSupplies < ActiveRecord::Migration[7.0]
  def change
    add_column :supplies, :shelf_id, :integer
    add_column :supplies, :warehouse_id, :integer
  end
end
