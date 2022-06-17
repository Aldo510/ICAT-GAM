class AddFieldsToSupplies < ActiveRecord::Migration[7.0]
  def change
    add_column :supplies, :expiry_date, :string, default: ""
    add_column :supplies, :category, :string, default: ""
    add_column :supplies, :sub_category, :string, default: ""
  end
end
