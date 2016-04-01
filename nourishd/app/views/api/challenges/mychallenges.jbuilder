json.array! @challenges do |challenge|
  json.id challenge.recipe.id
  json.image challenge.recipe.dish_image
  json.notes challenge.notes
  json.date challenge.created_at
end