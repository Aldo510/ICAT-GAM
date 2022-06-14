class AddFieldsToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :state, :string
    add_column :students, :municipality, :string
    add_column :students, :colony, :string
    add_column :students, :telephone, :string
    add_column :students, :cellphone, :string
    add_column :students, :study_level, :string
    add_column :students, :employment_situation, :string
    add_column :students, :priority_group, :string, default: "Ninguno"
    add_column :students, :disability, :string, default: "Ninguna"
    add_column :students, :indigenous, :string
    add_column :students, :speak_indigenous, :string, default: "Ninguna"
  end
end
