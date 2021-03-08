require './config/environment'
# Pry for debug -> take it out before deployment for production
require 'pry' # For bugging, remove before production
require 'date'
require "active_support/core_ext/time" # Support from ActiveRecord library to convert time in Ruby

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public' # Set the public path for javascript and css codes
    set :views, 'app/views' # Set the path for erb to read
    enable :sessions # Enable sessions
    set :session_secret, 'super_secret_hash_password'
  end

  get '/' do
    'hello world'
  end

  helpers do

    def format_time(time)
      time.strftime('%Y-%m-%d %H:%M')
    end

  end
end