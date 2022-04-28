class AddRolesToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :role, :string
  end
end
