class AddCertifiedOnlineToStudens < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :online_certified, :boolean, default: false
  end
end
