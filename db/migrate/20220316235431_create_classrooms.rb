class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :description
      t.integer :capacity
      t.float :size
      t.boolean :computing_equipment
      t.boolean :board
      t.boolean :moobiliary
      t.integer :chairs_quantity

      t.timestamps
    end
  end
end
