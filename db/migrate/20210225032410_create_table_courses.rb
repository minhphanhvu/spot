class CreateTableCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string "name", null: false
    end
  end
end
