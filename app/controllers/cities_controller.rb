class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @region = Region.find(params[:region_id])
    @city = City.find(params[:id])
    @country = @city.region.country
  end

  def new
    @region = Region.find(params[:region_id])
    @city = City.new

    @city.region = @region
  end

  def create
    @city = City.new(strong_cities)
    current_region = Region.find(params[:region_id])
    @city.region = current_region

    if @city.save 
      flash[:notice] = "City saved."
      redirect_to country_region_cities_path(current_region)
    else
      flash[:notice] = "Unable to save city."
    end
  end

  private

  def strong_cities
    params.require(:city).permit(:english_name, :native_language_name, :description, :city_website)
  end

end