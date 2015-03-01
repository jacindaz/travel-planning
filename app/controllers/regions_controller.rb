class RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def show
    binding.pry
    @country = Country.find(params[:id])
    @region = Region.find(params[:id])
    @cities = @region.cities
  end

  def new
    @country = Country.find(params[:country_id])
    @region = Region.new
  end

  def create
    binding.pry
    @region = Region.new(strong_regions)
    current_country = Country.find(params[:country_id])
    @region.country = current_country

    if @region.save 
      flash[:notice] = "Region saved."
      redirect_to country_regions_path(current_country)
    else
      flash[:notice] = "Unable to save region."
    end
  end

  private

  def strong_regions
    params.require(:region).permit(:english_name, :native_language_name, :description, :region_website)
  end
end
