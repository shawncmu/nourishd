class RecipesController < ApplicationController
  before_action :authenticate_current_user

  private

  def recipe_params
    params.require(:newRecipe).permit(:dish_image, :ingredients_image)
  end
end
