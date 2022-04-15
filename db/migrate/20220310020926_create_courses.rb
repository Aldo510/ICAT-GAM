class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :id_ddc
      t.string :site, default: "UC GAM"
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_hours
      t.integer :quantity
      t.text :days, array: true, default: []
      t.integer :sessions_number
      t.integer :profesor_id
      t.boolean :confirmed
      t.string :modality
      t.integer :academy_id
      t.string :status, default: "En preparación"
      t.integer :approved
      t.integer :reprobated
      t.string :downs
      t.string :cost

      t.timestamps
    end
  end
end
