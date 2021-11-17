class VehiclesController < ApplicationController


  # Shows all Vehicle instances sorted by name
  def index
    @vehicles = Vehicle.all.order("brand ASC")
  end
  
  # Shows a single Vehicle instance by passing in the id as a param
  def show
    @vehicle = Vehicle.find(params[:id])
  end

  # shows all vehicles that the current user has listed
  def mycars
      @vehicles = current_user.vehicles
  end 

  def new
    @vehicle = Vehicle.new
  end

  # Creates a new Vehicle listing by passing in the params
  def create
    @vehicle = Vehicle.new vehicle_params
    params.inspect
    @vehicle.user_id = current_user.id

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
      @vehicle = Vehicle.find(params[:id])

      respond_to do |format|
          if @vehicle.update vehicle_params
              format.html { redirect_to @vehicle }
          else
              format.html { render :edit }
          end
      end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    respond_to do |format|
      if @vehicle.destroy
        format.html { redirect_to @vehicle }
      end
    end
  end

  private
  # Sets the permitted params for the CRUD methods methods above.
  def vehicle_params
    params.require(:vehicle).permit(:brand, :model, :body_type, :door_count, :seat_count, :image, :available)
  end

end