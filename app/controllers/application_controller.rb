require './config/environment'

require 'pry' # For bugging, remove before production
require "active_support/all" # support some time and datetime methods from ActiveRecord

require 'yaml'

# Reference for authentication with Oauth and Slack
# https://github.com/omniauth/omniauth
# https://gist.github.com/ginjo/5fe43b4af8dd5b56725232548cda5d75

# Omniauth-Slack 
# https://github.com/ginjo/omniauth-slack/blob/v2.5.0/README.md

# slack
# https://api.slack.com/docs/sign-in-with-slack

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

  SLACK_OAUTH_KEY = ENV['SLACK_OAUTH_KEY']
  SLACK_OAUTH_SECRET = ENV['SLACK_OAUTH_SECRET']
  TEAM_ID = ENV['TEAM_ID'] # Launch School

  # Check this - may add an insecurity?
  OmniAuth.config.allowed_request_methods = [:get, :post]
  
  use OmniAuth::Builder do
    # provider :developer 
    provider :slack, SLACK_OAUTH_KEY, SLACK_OAUTH_SECRET, user_scope: 'identity.basic,identity.team', team: TEAM_ID
  end

  get '/auth/:provider/callback' do
    result = { 
      auth_hash:    env['omniauth.auth'],
      access_token: env['omniauth.strategy'].access_token
    }.to_yaml
    
    content_type 'text/yaml'
    result
  end
  
  get '/auth/failure' do
    params[:message]
  end

  get '/' do
    # authorize!('/login')
    'hello world, <a href="/auth/slack">login</a>'
  end

  helpers do

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