class User < ActiveRecord::Base
  has_many :spot_students, foreign_key: 'student_id'
  has_many :spots, :through => :spot_students
end