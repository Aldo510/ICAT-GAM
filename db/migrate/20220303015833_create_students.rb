class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :id_ddc
      t.string :name
      t.string :last_name
      t.string :second_last_name
      t.integer :taken_courses, default: 0
      t.string :gender
      t.string :curp
      t.string :scholarity
      t.string :email

      t.timestamps
    end
  end
end
