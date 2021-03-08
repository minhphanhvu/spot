class UsersController < ApplicationController

  # Home page for each user
  get '/index/:username' do
    @user = User.find_by(username: params[:username])
    @spots = @user.spots.where('session_datetime >= ?', Time.now)
    @all_spots = Spot.where('session_datetime >= ?', Time.now).order(session_datetime: :asc)
    @previous_spots = @user.spots.where('session_datetime <= ?', Time.now)
    erb :index, layout: :layout
  end
end