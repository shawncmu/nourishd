json.merge! @recipe.attributes
json.dish_image @recipe.dish_image
json.ingredients_image @recipe.ingredients_image
json.instructions @recipe.instructions
json.ingredients @recipe.quantities do |quantity|
  json.ingredient quantity.ingredient.name
  json.quantity quantity.measurement
end