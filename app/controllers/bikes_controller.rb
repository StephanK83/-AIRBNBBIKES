class BikesController < ApplicationController
  def index
    @bike = Bike.all
  end
end
