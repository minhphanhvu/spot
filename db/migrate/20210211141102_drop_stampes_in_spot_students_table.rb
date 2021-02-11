class DropStampesInSpotStudentsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :spot_students, :created_at
    remove_column :spot_students, :updated_at
  end
end
