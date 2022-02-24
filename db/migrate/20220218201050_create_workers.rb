class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :last_name
      t.string :mail
      t.string :telephone
      t.string :password_digest

      t.timestamps
    end
  end
end
