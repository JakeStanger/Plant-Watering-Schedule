class PlantsController < ApplicationController
  before_action :require_user, only: %i[index show destroy]

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to '/plants'
    else
      render 'new'
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update_attributes(plant_params)
      redirect_to(action: 'show', id: @plant.id)
    else
      render 'edit'
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to '/plants'
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :common_names, :watering_time,
                                  :sunlight_exposure, :summer_environment,
                                  :winter_environment, :description, :info_link)
  end
end
