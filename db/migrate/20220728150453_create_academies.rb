class CreateAcademies < ActiveRecord::Migration[7.0]
  def change
    create_table :academies do |t|
      t.string :name, default: ""
      t.string :description, default: ""

      t.timestamps
    end
  end
end
