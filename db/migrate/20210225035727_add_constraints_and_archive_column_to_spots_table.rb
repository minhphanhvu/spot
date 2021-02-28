class AddConstraintsAndArchiveColumnToSpotsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :archive, :boolean, :default => false
    add_foreign_key :spots, :courses, column: :course_id
  end
end
