class CreateSpotsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.references :lead, foreign_key: true
      t.references :course, foreign_key: true
      t.timestamp :scheduled_at, null: false
    end
  end
end
