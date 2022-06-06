class AddPositionToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :position, :string
  end
end
