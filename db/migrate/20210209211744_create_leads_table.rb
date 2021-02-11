class CreateLeadsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :slack_name, null: false
      t.string :name
      t.string :username, null: false
      t.string :password_digest, null: false
    end
  end
end
