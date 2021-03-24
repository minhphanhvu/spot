require './config/environment'

require 'pry' # For bugging, remove before production
require "active_support/all" # support some time and datetime methods from ActiveRecord
require 'sinatra/reloader'
require 'calendar_helper'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public' # Set the public path for javascript and css codes
    set :views, 'app/views' # Set the path for erb to read
    enable :sessions # Enable sessions
    set :session_secret, 'super_secret_hash_password'
    set :environment, :development # set environment
    # Enables put and delete methods with :method_override
    enable :method_override # Sinatra::Base disables method_override by default
  end

  get '/' do
    'hello world'
  end

  helpers do
    include CalendarHelper

    def format_time_output(time) # take argument as a datetime postgresql object
      time.strftime('%Y-%m-%d %H:%M')
    end

    def week_beginning_input(time) # take argument as a time string -> convert to Date object
      Date.strptime(time, '%Y-%m-%d').beginning_of_week.strftime('%Y-%m-%d')
    end

    # def session_datetime_input(time) # take argumnet as a time string -> convert to DateTime object
    #   DateTime.strptime(time, '%Y-%m-%dT%H:%M') + 5.hours # add 5 more hours to UTC time
    # end

  end
end