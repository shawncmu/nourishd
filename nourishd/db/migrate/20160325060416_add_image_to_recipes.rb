class AddImageToRecipes < ActiveRecord::Migration
  def change
    add_attachment :recipes, :dish_image
    add_attachment :recipes, :ingredients_image
    add_attachment :challenges, :creator_image
    add_attachment :challenges, :participant_image
    add_attachment :user, :avatar_image
  end
end
