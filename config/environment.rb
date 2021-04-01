ENV['SINATRA_ENV'] ||= "development"
require 'dotenv/load'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require './app/controllers/application_controller'
require_all 'app'
