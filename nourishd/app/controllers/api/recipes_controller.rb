class Api::RecipesController < ApplicationController
  # before_action :authenticate_current_user

  def index
    @recipes = Recipe.all
    respond_to do |format|
      # format.json { render 'index.jbuilder' }
      format.json {render json: @recipes}
    end
  end

  # private

  # def recipe_params
  #   params.require(:newRecipe).permit(:dish_image, :ingredients_image)
  # end
end
