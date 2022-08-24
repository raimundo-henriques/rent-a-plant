require 'open-uri'

class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @plants = policy_scope(Plant.search_by_common_and_latin_name(params[:query]))
    else
      @plants = policy_scope(Plant)
    end


    @markers = @plants.map do |plant|
      address = plant.address.parameterize.gsub(' ', '%20').gsub(',', '%2C')
      geocoder_url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{address}.json?proximity=ip&types=place%2Cpostcode%2Caddress&access_token=#{ENV['MAPBOX_API_KEY']}"
      geocoder_serialized = URI.open(geocoder_url).read
      geocoder_json = JSON.parse(geocoder_serialized)
      {
        lat: geocoder_json["features"][0]["geometry"]["coordinates"][1],
        lng: geocoder_json["features"][0]["geometry"]["coordinates"][0],
        info_window: render_to_string(partial: "info_window", locals: {plant: plant}),
        image_url: helpers.asset_url("pagelines-brands.png")
      }
    end
  end

  def show
    authorize @plant
    @plant.avg_rating = @plant.ratings.sum / (@plant.ratings.length.positive? ? @plant.ratings.length : 1)
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    authorize @plant
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def my_plants
    @plants = policy_scope(current_user.plants)
    authorize @plants
  end

  def edit
    authorize @plant
  end

  def update
    authorize @plant
    if @plant.update(plant_params)
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def destroy
    authorize @plant
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:common_name, :latin_name, :family, :temp_min, :temp_max, :ideal_light, :tolerated_light, :difficulty_level, :photo)
  end
end
