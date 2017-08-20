class PlantsController < ApplicationController
  before_action :require_user, only: %i[destroy new edit]

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
    @tags = @plant.tags
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(full_params)
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
    if @plant.update_attributes(full_params)
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

  helper_method :all_tags
  def all_tags
    tags = Tag.all
    tags.each { |t| { name: t.name, id: t.id } }
  end

  helper_method :tag_list
  def tag_list
    plant = Plant.find(params[:id])
    plant.tags.each { |t| { name: t.name, id: t.id } } # TODO: convert to proc
  end

  private

  def full_params
    params = plant_params

    # Get tags from IDs
    tag_ids = params[:tag_list]
    tags = tag_ids.split(',').collect { |t| Tag.find(t) }

    # Replace IDs with instances
    params.delete(:tag_list)
    params[:tags] = tags
    params
  end

  def plant_params
    params.require(:plant).permit(:name, :common_names, :watering_time,
                                  :sunlight_exposure, :summer_environment,
                                  :winter_environment, :description, :info_link,
                                  :tag_list)
  end
end
