json.array! @challenges do |challenge|
  json.id challenge.id
  json.recipe_id challenge.recipe_id
  json.recipe_name challenge.recipe.name
  json.creator_id challenge.creator_id
  json.creator_status challenge.creator_status
  json.participant_id challenge.participant_id
  json.participant_acceptance challenge.participant_acceptance
  json.post_status challenge.post_status
  json.post_type challenge.post_type
  json.notes challenge.notes
  json.dish_image challenge.recipe.dish_image
  json.creator_image challenge.creator_image
  json.participant_image challenge.participant_image
  json.date challenge.created_at
  json.creator_username challenge.creator.username
  json.participant_username challenge.participant.username
  json.creator_avatar challenge.creator.avatar_image
  json.participant_avatar challenge.participant.avatar_image
  json.creator_likes challenge.likes.where(winner:"creator").count
  json.participant_likes challenge.likes.where(winner:"participant").count
    json.comments challenge.comments do |comment|
    json.comment comment.comment
    json.username comment.user.username
    json.avatar comment.user.avatar_image
  end
  if challenge.likes.where(user_id:@user.id).blank?
    json.voted_before false
  else
    json.voted_before true
  end
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
