class CreateCoursesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_name, null: false
    end
  end
end
