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
      render status: 201, json: {
        mesage: "Successfully created location!",
        location: location
      }.to_json
    else
      render status: 422, json: {
        errors: location.errors,
        mesage: "You done fucked up."
      }.to_json
    end
  end

  def update
    location = Location.find(params[:id])
    if location.update(location_params)
      render status: 200, json: {
        message: "you Successfully updated this location",
        location: location
      }.to_json
    else
      render status: 422, json: {
        message: "The location could not be updated, go back to code school!",
        location: location
      }.to_json
    end
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    render status: 200, json: {
      message: "You deleted the location! Hope you meant to do that."
    }.to_json
  end


  private
  def location_params
    params.require("location").permit("name")
  end
end
