class LocationsController < ApplicationController
  before_action :authorize, only: [:index]
  before_action :authorize_admin, only: [:new, :edit]
  def index
    @location = Location.all

  end

  def show
    @location =Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
      if @location.save
        flash[:notice] = "Location Successfully Added"
        redirect_to locations_path
      else
        render :new
      end
    end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
  end

  private
    def location_params
      params.require(:location).permit(:name, :avatar)
    end

end
