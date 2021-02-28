class AddConstraintsToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :username, :unique => true
    add_foreign_key :spots, :users, column: :lead_id
  end
end
