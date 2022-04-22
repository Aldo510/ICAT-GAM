class CreateProfessors < ActiveRecord::Migration[7.0]
  def change
    create_table :professors do |t|
      t.integer :course_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
