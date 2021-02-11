require './config/environment'
# Pry for debug -> take it out before deployment for production
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'super_secret_hash_password'
  end

  # Index page
  get "/" do
    erb :index
  end

  # Login page
  get "/login" do
    erb :login
  end

  # Log every lead or student out
  post "/signout" do
    session.clear

    redirect "/"
  end

  helpers do

    def lead_signed_in?
      session.key?(:lead_id)
    end

    def require_signed_in_lead
      unless lead_signed_in?
        session[:error] = "Please sign in as a lead for this page."
        
        redirect "/leads/login"
      end
    end

    def student_signed_in?
      session.key?(:student_id)
    end

    def require_signed_in_student
      unless student_signed_in?
        session[:error] = "Please sign in as a student to use this page."

        redirect "/students/login"
      end
    end

  end

end