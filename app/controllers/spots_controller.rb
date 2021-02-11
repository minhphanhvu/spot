class SpotsController < ApplicationController

  # Lead can sign up for a spot
  get "/spots/add/:lead_id" do
    require_signed_in_lead

    @lead_id = params[:lead_id]
    @courses = Course.select(:id, :course_name)
    erb :'spots/add'
  end

  # Process a registered spot
  post "/spots/add/:lead_id" do
    require_signed_in_lead

    @lead_id = params[:lead_id]
    @spot = Spot.create(
      lead_id: @lead_id,
      course_id: params[:course_id],
      scheduled_at: params[:scheduled_at]
    )

    redirect "/leads/show/#{@lead_id}"
  end

end