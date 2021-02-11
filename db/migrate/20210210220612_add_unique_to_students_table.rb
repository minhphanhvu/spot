class AddUniqueToStudentsTable < ActiveRecord::Migration[5.2]
  def change
    add_index :students, :slack_name, :unique => true
    add_index :students, :username, :unique => true
  end
end
