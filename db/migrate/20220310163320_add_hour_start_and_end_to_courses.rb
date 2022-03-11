class AddHourStartAndEndToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :start_hour, :time
    add_column :courses, :end_hour, :time
  end
end
