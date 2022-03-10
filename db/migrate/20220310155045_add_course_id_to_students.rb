class AddCourseIdToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :course_id, :integer
  end
end
