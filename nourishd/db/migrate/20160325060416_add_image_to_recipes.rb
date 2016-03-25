class AddImageToRecipes < ActiveRecord::Migration
  def change
    add_attachment :recipes, :dish_image
    add_attachment :recipes, :ingredients_image
  end
end
