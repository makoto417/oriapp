
100.times do 
  user_id = 4
  board_id = Faker::Number.between(from:15, to:64)
  content = Faker::Lorem.paragraph_by_chars
  Comment.create!(
    user_id: user_id,
    board_id: board_id,
    content: content
  )
end
