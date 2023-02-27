class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all.includes(:bike)
  end

  def new
    bike = Bike.find_by(brand: params[:bike_brand])
    @booking = Booking.new(bike: bike)
  end

  def create
    @bike = Bike.find(params[:booking][:bike_id])
    @booking = @bike.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully!"
    else
      render :new
    end
  end

  def show
    @bike = @booking.bike
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking) # what does the _path do? It's a helper method that generate a url to the show action
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id) # deleted :total_price
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
