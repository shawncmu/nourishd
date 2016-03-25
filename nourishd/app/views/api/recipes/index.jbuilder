json.array! @recipes do |recipe|
  json.id recipe.id
  json.name recipe.name
  json.image recipe.dish_image
end