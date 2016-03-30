class AddImageToRecipes < ActiveRecord::Migration
  def change
    add_attachment :recipes, :dish_image
    add_attachment :recipes, :ingredients_image
    add_attachment :challenges, :completed_image1
    add_attachment :challenges, :completed_image2
    add_attachment :user, :avatar_image
  end
end
