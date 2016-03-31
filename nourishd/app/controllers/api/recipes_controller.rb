class API::RecipesController < ApplicationController
  # before_action :authenticate_current_user

  def index
    @recipes = Recipe.all
    respond_to do |format|
      format.json { render 'index.jbuilder' }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      format.json { render 'showonerecipe.jbuilder' }
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.json { render json: @recipe }
      else
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = Recipe.update(params[:id], edit_recipe_params)
    respond_to do |format|
      if @recipe.save
        format.json { render json: @recipe }
      else
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Recipe.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def recipe_params
    params.require(:newRecipe).permit(:name, :video_url, :cook_time, :serving, :course, :vegan, :gluten_free, :low_carb, :dairy_free, :nut_free, :soy_free, :equipment, :dish_image, :ingredients_image)
  end

  def edit_recipe_params
    params.require(:editRecipe).permit(:name, :video_url, :cook_time, :serving, :course, :vegan, :gluten_free, :low_carb, :dairy_free, :nut_free, :soy_free, :equipment)
  end
end