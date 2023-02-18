class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user # we need to assign the creation of a bike to a user
    @bike.save!
    redirect_to bikes_path
  end

  def show
    # @bike = bike_params[:id] # this won't work because we are not searching for it (? >> Ask TA
    @bike = Bike.find(params[:id])
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id]) # can we call the "show" method to get the bike we want to update? >> Ask TA
    @bike.update(bike_params)
    redirect_to bike_path(@bike) # what does the _path do? It's a helper method that generate a url to the show action
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to bikes_path # this is going to direct us to the show page? >> ask TA, how does it work?
  end

  private

  def bike_params
    params.require(:bike).permit(:brand, :color, :price)
  end
end
