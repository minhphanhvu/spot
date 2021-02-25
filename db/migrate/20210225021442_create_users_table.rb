class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "username", null: false
      t.string "password_digest", null: false
      t.boolean "is_lead", default: false
      t.boolean "is_admin", default: false
      t.timestamp "created_at"
    end
  end
end
