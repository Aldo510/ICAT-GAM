class AddFieldsToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :trade_number, :string, default: ""
    add_column :courses, :pedagogical_package_read, :string, default: ""
    add_column :courses, :id_classroom, :integer
    add_column :courses, :trained_men, :integer, default: 0
    add_column :courses, :trained_women, :integer, default: 0
    add_column :courses, :approved_women, :integer, default: 0
    add_column :courses, :reprobated_women, :integer, default: 0
    add_column :courses, :down_women, :integer, default: 0 
  end
end
