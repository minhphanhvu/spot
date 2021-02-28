class User < ActiveRecord::Base
  has_many :spots, :through => :spot_students
  has_many :spot_students
end