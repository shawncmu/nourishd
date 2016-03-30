json.array! @challenges do |challenge|
  json.id challenge.id
  json.image challenge.completed_image
  json.notes challenge.notes
  json.date challenge.created_at
end