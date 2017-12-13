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
      head 200
    else
      head 500
    end
  end

  private
  def location_params
    params.require("location").permit("name")
  end
end
