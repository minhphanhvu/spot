class CreateStudentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :slack_name, null: false
      t.string :name
      t.string :username, null: false
      t.string :password_digest
    end
  end
end
