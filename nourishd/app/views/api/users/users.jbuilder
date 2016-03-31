json.array! @users do |user|
  json.id user.id
  json.username user.username
  json.avatar_image user.avatar_image
  json.vegan user.vegan
  json.gluten_free user.gluten_free
  json.dairy_free user.dairy_free
  json.nut_free user.nut_free
  json.soy_free user.soy_free
end