class UsersController < ApplicationController

  # Home page for each user
  get '/index/:username' do
    @user = User.find_by(username: params[:username])
    @spots = @user.spots.where('session_datetime >= ?', Time.now.utc)
    @all_spots = Spot.where('session_datetime >= ?', Time.now.utc).order(session_datetime: :asc)
    @previous_spots = @user.spots.where('session_datetime <= ?', Time.now.utc)
    @courses = Course.all
    erb :index, layout: :layout
  end

  # Lead register a new session
  post '/new/lead/:username' do
    lead_id = User.find_by(username: params[:username]).id
    course_id = params[:course_id]
    week_beginning = week_beginning_input(params[:spot_time])
    session_datetime = session_datetime_input(params[:spot_time])

    @new_spot = {lead_id: lead_id,
                 course_id: course_id,
                 week_beginning: week_beginning,
                 session_datetime: session_datetime,
                 student_limit: 5,
                 date_created: DateTime.now
                }
    Spot.create(@new_spot)

    redirect "/index/#{params[:username]}"
  end

end