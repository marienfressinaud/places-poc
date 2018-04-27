class PlacesController < ApplicationController
  def index
    @places = Place.order("RANDOM()").first(5)
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place
    else
      render 'new'
    end
  end

  private

    def place_params
      params.require(:place).permit(:name,
                                    :description,
                                    :address_line1,
                                    :address_zip,
                                    :address_city)
    end
end
