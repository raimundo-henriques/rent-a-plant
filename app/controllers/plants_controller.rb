class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_plant, only: :show
  def index
    @plants = policy_scope(Plant)
  end

  def show
    authorize @plant
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

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:common_name, :latin_name, :family, :temp_min, :temp_max, :ideal_light, :tolerated_light, :difficulty_level, :photo)
  end
end
