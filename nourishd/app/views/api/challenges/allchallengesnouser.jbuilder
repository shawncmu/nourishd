json.array! @challenges do |challenge|
  json.id challenge.id
  json.recipe_id challenge.recipe_id
  json.recipe_name challenge.recipe.name
  json.creator_id challenge.creator_id
  json.participant_id challenge.participant_id
  json.post_status challenge.post_status
  json.post_type challenge.post_type
  json.creator_image challenge.creator_image
  json.participant_image challenge.participant_image
  json.date challenge.created_at
  json.creator_username challenge.creator.username
  json.participant_username challenge.participant.username
  json.creator_avatar challenge.creator.avatar_image
  json.participant_avatar challenge.participant.avatar_image
  json.creator_likes challenge.likes.where(winner:"creator").count
  json.participant_likes challenge.likes.where(winner:"participant").count
  json.voted_before true
end