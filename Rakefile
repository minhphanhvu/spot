ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

namespace :spot do
  desc "Create spots for the coming week for all courses"

  task :create_spots do 
    monday = Date.parse('Monday')
    delta = monday > Date.today ? 0 : 7
    monday += delta

    Course.all.each do |course|
      next if Spot.exists?(course: course, week_beginning: monday)
      Spot.create(course: course, week_beginning: monday)
    end

  end
end