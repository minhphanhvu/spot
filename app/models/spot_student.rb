class SpotStudent < ActiveRecord::Base
  belongs_to :spot
  belongs_to :student
end