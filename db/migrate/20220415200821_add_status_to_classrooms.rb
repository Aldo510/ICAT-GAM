class AddStatusToClassrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :classrooms, :status, :boolean, default: true
  end
end
