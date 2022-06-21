class AddFieldsToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :pedagocical_package, :string, default: ""
    add_column :courses, :accreditation_notices, :string, detaul: ""
    add_column :courses, :content_tab, :string
  end
end
