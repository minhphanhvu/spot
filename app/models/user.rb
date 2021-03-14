class User < ActiveRecord::Base
  # For the relationship many-to-many between students and spots
  has_many :spot_students, foreign_key: 'student_id'
  has_many :spots, :through => :spot_students
  # For the relationship one-to-many between lead and spots
  has_many :spots, foreign_key: 'lead_id'

  def timezone
    # Stub so we can overwrite with user's own timezone info later
    "Eastern Time (US & Canada)"
  end

end