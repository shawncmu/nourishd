json.array! @challenges do |challenge|
  json.id challenge.id
  json.recipe_id challenge.recipe_id
  json.recipe_name challenge.recipe.name
  json.creator_id challenge.creator_id
  json.participant_id challenge.participant_id
  json.participant_status challenge.participant_status
  json.post_status challenge.post_status
  json.notes challenge.notes
  json.dish_image challenge.recipe.dish_image
  json.creator_image challenge.creator_image
  json.participant_image challenge.participant_image
  json.date challenge.created_at
  if @user.id == challenge.creator_id
    json.creator "me"
    json.other_player challenge.participant.username
    json.other_player_image challenge.participant.avatar_image
    json.other_player_status challenge.participant_status
  else
    json.creator "other"
    json.other_player challenge.creator.username
    json.other_player_image challenge.creator.avatar_image
    json.other_player_status challenge.creator_status
  end

end