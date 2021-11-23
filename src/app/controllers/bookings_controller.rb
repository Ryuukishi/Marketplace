class BookingsController < ApplicationController
  
  def index
    @bookings = current_user.bookings.all
  end
  
  def new
  end

  def create
  end

  def delete
  end
end
