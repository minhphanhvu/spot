class Spot < ActiveRecord::Base
  has_many :spot_students
  has_many :users, :through => :spot_students
  belongs_to :user
  belongs_to :course
end