class LeadsController < ApplicationController

  # Ask the lead the key before authorizing
  get "/leads/signup_validation" do
    erb :'/leads/signup_validation'
  end

  # Validate sign up key for lead and redirect to sign up form
  post "/leads/signup_validation" do
    if params[:signup_lead_password] == "super_secret_lead"
      session[:success] = "Congrats! Please sign up as a lead."
      erb :'/leads/signup'
    else
      session[:error] = "Wrong key. Please validate your key again."

      redirect "/leads/signup_validation"
    end
  end

  # Register a lead and redirect to the main page of the lead
  post "/leads/signup" do
    @lead = Lead.create(
      slack_name: params[:slack_name],
      name: params[:name],
      username: params[:username],
      password: params[:password]
    )
    session[:lead_id] = @lead.id

    redirect "/leads/show/#{@lead.id}"
  end

  # Log in as a lead - form
  get "/leads/login" do
    erb :'/leads/login'
  end

  # Authenticate the lead and login
  post "/leads/login" do
    @lead = Lead.find_by(username: params[:username])
    # Authenticate the lead with authenticate by bcrypt gem
    if @lead && @lead.authenticate(params[:password])
      session[:lead_id] = @lead.id

      redirect "/leads/show/#{@lead.id}"
    else
      session[:error] = "Invalid credentials for leads."

      redirect "/leads/login"
    end
  end

  # Lead main page for each lead - and retrieve which spots the lead currently has
  get "/leads/show/:lead_id" do
    require_signed_in_lead

    @lead_id = params[:lead_id]
    @lead_spots = Course.joins(:spots).select('spots.scheduled_at, courses.course_name').where(spots: {lead_id: @lead_id})

    erb :'/leads/show'
  end

end