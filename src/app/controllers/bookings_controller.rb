class BookingsController < ApplicationController

  # Shows all bookings made by the current user
  def bookings_index
    @bookings = current_user.bookings
  end
  
  # Show a single booking
  def booking_show
    @booking = Booking.find(params[:id])
  end

  # Creates a new booking
  def create
    @booking = Booking.new
    @booking.user_id = current_user.id
    @booking.vehicle_id = params[:id]
    respond_to do |format|
      if @booking.save
        @booking.vehicle.update(available: false)
        format.html { redirect_to @booking }
      end 
    end 
  end

  # Destroys a booking
  def destroy
    @booking = Booking.find(params[:id])
    respond_to do |format|
      if @booking.destroy
        @booking.vehicle.update(available: true)
        format.html { redirect_to @booking }
      end
    end
  end

end

