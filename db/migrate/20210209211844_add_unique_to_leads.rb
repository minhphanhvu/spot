class AddUniqueToLeads < ActiveRecord::Migration[5.2]
  def change
    add_index :leads, :slack_name, :unique => true
    add_index :leads, :username, :unique => true
  end
end
