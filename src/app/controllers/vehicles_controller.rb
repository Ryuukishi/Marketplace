class VehiclesController < ApplicationController
  
  # before_action :set_vehicle


  def index
    @vehicles = Vehicle.all.order("brand ASC")
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end


  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = current_user.id
  end

  def update
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to vehicles_path
  end

  private
  
  # def set_vehicle
  #   @vehicle = Vehicle.find(params[:id])
  # end
end