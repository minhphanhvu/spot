require './config/environment'
# Pry for debug -> take it out before deployment for production
require 'pry'
require 'date'

class ApplicationController < Sinatra::Base
  get '/' do
    'hello world'
  end

  get '/index/:username' do
    user = User.find_by(username: params[:username])
    @spots = user.spots.where('session_datetime >= ?', DateTime.now)
    @all_spots = Spot.where('session_datetime >= ?', DateTime.now).order(session_datetime: :desc)
    @previous_spots = user.spots.where('session_datetime <= ?', DateTime.now)
    erb :index, layout: :layout
  end
end