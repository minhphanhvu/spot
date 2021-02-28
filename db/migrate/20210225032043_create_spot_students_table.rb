class CreateSpotStudentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_students do |t|
      t.integer "spot_id", null: false
      t.integer "student_id", null: false
    end
  end
end
