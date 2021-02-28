class CreateSpotsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer "lead_id", default: 0
      t.integer "course_id", null: false
      t.date "week_beginning"
      t.timestamp "session_datetime"
      t.integer "student_limit"
      t.date "date_created"
    end
  end
end
