class Api::LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Location.all
  end

  def show
    location = Location.find(params[:id])
    render json: location
  end

  def create
    location = Location.new(location_params)
    if location.save
      render json: {
        status: 200,
        mesage: "Successfully created location!",
        location: location
      }.to_json
    else
      render json: {
        status: 500,
        errors: location.errors,
        mesage: "You done fucked up."
      }.to_json
    end
  end

  private
  def location_params
    params.require("location").permit("name")
  end
end
