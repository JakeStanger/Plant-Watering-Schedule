class UserPlantsController < ApplicationController
  before_action :require_user, only: %i[index show destroy new edit]


  def show
    @user_plant = UserPlant.find(params[:id])
  end

  def new
    @user_plant = UserPlant.new
  end

  def create
    @user_plant = UserPlant.new(full_params)

    if @user_plant.save
      redirect_to "/users/#{current_user.id}"
    else
      render 'new'
    end
  end

  def edit
    @user_plant = UserPlant.find(params[:id])
  end

  def update
    @user_plant = UserPlant.find(params[:id])
    if @user_plant.update_attributes(full_params)
      redirect_to(action: 'show', id: @user_plant.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user_plant = UserPlant.find(params[:id])
    @user_plant.destroy
    redirect_to "/users/#{current_user.id}"
  end

  private

  def full_params
    params = user_plant_params

    # Fetch plant and user from ID
    params[:plant] = Plant.find(params[:plant])
    params[:user] = current_user

    params
  end

  def user_plant_params
    params.require(:user_plant).permit(:plant, :user, :custom_name,
                                       :notes, :last_watered)
  end
end
