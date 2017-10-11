class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users_tables do |t|
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
