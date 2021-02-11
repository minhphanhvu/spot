class Student < ActiveRecord::Base
  has_secure_password
  has_many :spot_students
  has_many :spots, :through => :spot_students
end