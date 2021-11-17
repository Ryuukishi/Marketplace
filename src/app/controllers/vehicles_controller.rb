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
      if ! current_user.owner
        @vehicles = []
      else
        @vehicles = current_user.owner.vehicles
      end
  end 

  def new
    @vehicle = Vehicle.new
  end

  # Creates a new Vehicle listing by passing in the params
  def create
      check_owners_exist
      
      owner_id = current_user.owner.id
      @vehicle = Vehicle.new vehicle_params
      @vehicle.owner_id = owner_id
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

  # Due to the nature of this particular two-sided marketplace where users are renting and leasing cars rather than buying and selling, a transfer of ownership is
  # not taking place therefore we need to perform this check to make sure a new instance of Owner is created which belongs to the User model. This must be done because
  # Vehicles need an owner_id as the foreign key otherwise it won't save to the database when creating a new instance of Vehicle. 

  def check_owners_exist
    if ! current_user.owner
      Owner.create(user: current_user)
    end
  end
end