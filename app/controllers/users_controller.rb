class UsersController < ApplicationController

  # Home page for each user
  get '/index/:username' do
    @user = User.find_by(username: params[:username])
    @spots = @user.spots.where('week_beginning >= ?', Time.now.utc)
    @all_spots = Spot.ordered.where('week_beginning >= ?', Time.now.utc)
    @previous_spots = @user.spots.where('session_datetime <= ?', Time.now.utc)
    @courses = Course.all
    erb :index, layout: :layout
  end

  # Lead register a new session
  post '/new/lead/:username' do
    user = User.find_by(username: params[:username])
    lead_id = user.id
    course_id = params[:course_id]
    week_beginning = week_beginning_input(params[:spot_time])
    
    session_datetime = params[:spot_time].in_time_zone(user.timezone)

    new_spot = {
      lead_id: lead_id,
      course_id: course_id,
      week_beginning: week_beginning,
      session_datetime: session_datetime,
      student_limit: 5,
      date_created: DateTime.now
    }
    Spot.create(new_spot)

    redirect "/index/#{params[:username]}"
  end

  # Delete the scheduled spot session
  delete '/delete/:username/:spot_id' do
    spot_id = params[:spot_id]
    SpotStudent.where(:spot_id => spot_id).destroy_all # Delete all rows from spot_students table first (foreign key constraints)
    Spot.destroy(spot_id)

    redirect "/index/#{params[:username]}"
  end

end