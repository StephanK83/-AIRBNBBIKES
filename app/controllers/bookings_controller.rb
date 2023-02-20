class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show 

  end

  def new 
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)  
    @booking = current_user.bookings.build(booking_params)
    @booking.save
    # redirect_to bike_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id)
  end
end
