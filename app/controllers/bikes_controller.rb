class BikesController < ApplicationController
  def index
    @bike = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.save
  end

  private

  def bike_params
    params.require(:bike).permit(:brand, :color, :price)
  end

end
