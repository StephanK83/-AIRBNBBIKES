class BikesController < ApplicationController
  def index
    @bike = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    @bike.save
  end

  def show
    @bike = bike_params[:id] #not sure if it's right
  end

  def edit
    
  end



  private

  def bike_params
    params.require(:bike).permit(:brand, :color, :price)
  end

end
