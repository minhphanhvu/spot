class Spot < ActiveRecord::Base
  belongs_to :lead
  belongs_to :course
  has_many :spot_students
  has_many :students, :through => :spot_students
end