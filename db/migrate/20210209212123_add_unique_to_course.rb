class AddUniqueToCourse < ActiveRecord::Migration[5.2]
  def change
    add_index :courses, :course_name, :unique => true
  end
end
