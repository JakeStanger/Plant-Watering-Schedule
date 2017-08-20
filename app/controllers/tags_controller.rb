class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @plants = @tag.plants
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to '/tags'
  end
end
