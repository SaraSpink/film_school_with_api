class LocationsController < ApplicationController
  before_action :authorize, only: [:index]
  before_action :authorize_admin, only: [:new]
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end
end
