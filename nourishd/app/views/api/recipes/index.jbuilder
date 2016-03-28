json.array! @recipes do |recipe|
  json.id recipe.id
  json.name recipe.name
  json.image recipe.dish_image
  json.vegan recipe.vegan
  json.gluten_free recipe.gluten_free
  json.low_carb recipe.low_carb
  json.course recipe.course
end