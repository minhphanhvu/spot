class ChangeSpotToUseCreatedAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :spots, :date_created, :created_at
  end
end
