class ChangeSpotLeadDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :spots, :lead_id, from: 0, to: nil
  end
end
