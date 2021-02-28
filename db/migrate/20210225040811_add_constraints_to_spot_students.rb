class AddConstraintsToSpotStudents < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :spot_students, :spots, column: :spot_id
    add_foreign_key :spot_students, :users, column: :student_id
  end
end
