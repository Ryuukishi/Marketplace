class VehiclesController < ApplicationController
  
  before_action :vehicle_params


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
    @vehicle = Vehicle.new vehicle_params
    # @vehicle.user_id = current_user.id
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicles_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to vehicles_path
  end

  private
  
  def vehicle_params
    params.permit(:brand, :model, :body_type, :door_count)
  end

end