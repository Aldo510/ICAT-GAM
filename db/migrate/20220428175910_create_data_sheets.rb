class CreateDataSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :data_sheets do |t|
      t.integer :course_id

      t.timestamps
    end
  end
end
