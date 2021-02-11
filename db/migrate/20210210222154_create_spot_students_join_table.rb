class CreateSpotStudentsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_students do |t|
      t.references :spot, foreign_key: true, index: true
      t.references :student, foreign_key: true, index: true
      t.timestamps
    end
  end
end
