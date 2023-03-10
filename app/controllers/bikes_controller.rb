class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.all
    # The `geocoded` scope filters only bikes with coordinates 24.02.23
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {bike: bike}),
        marker_html: render_to_string(partial: "marker", locals: {bike: bike})
      }
    end
    #pg_search gem added 25.02.23
    if params[:id].present?
      @bikes = Bike.search_by_brand_and_address(params[:id])
    else
      @bikes = Bike.all
    end
  end

  def show
    # @bike = bike_params[:id]
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user # we need to assign the creation of a bike to a user
    if @bike.save # we use '!' to know if there is an error
      redirect_to bikes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to bike_path(@bike) # what does the _path do? It's a helper method that generate a url to the show action
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy # doesn't work yet(!)
    @bike.destroy
    redirect_to bikes_path # this is going to direct us to the show page? >> ask TA, how does it work?
  end

  private

  def bike_params
    params.require(:bike).permit(:brand, :color, :size, :price, :category, :address, :photo)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
