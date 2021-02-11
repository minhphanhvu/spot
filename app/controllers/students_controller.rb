class StudentsController < ApplicationController

  # Ask the student the key before authorizing
  get "/students/signup_validation" do
    erb :'/students/signup_validation'
  end

  # Validate sign up key for student and redirect to sign up form
  post "/students/signup_validation" do
    if params[:signup_student_password] == "super_secret_student"
      session[:success] = "Congrats! Please sign up as a student."
      erb :'/students/signup'
    else
      session[:error] = "Wrong key. Please validate your key again."

      redirect "/students/signup_validation"
    end
  end

  # Register a student and redirect to the main page of the student
  post "/students/signup" do
    @student = Student.create(
      slack_name: params[:slack_name],
      name: params[:name],
      username: params[:username],
      password: params[:password]
    )

    redirect "/students/show/#{@student.id}"
  end

  # Student main page
  get "/students/show/:student_id" do
    @student = Student.find_by(id: params[:student_id])
    @spots = Course.joins(:spots).select("spots.scheduled_at, spots.id, courses.course_name")

    erb :'/students/show'
  end

  # Student sign up for a spot
  get "/students/spot/:spot_id" do
    # Register student to the spots
  end
end