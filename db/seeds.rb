# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

50.times do
  friend = Friend.create!(
    user_id: 1,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    categories: %w[sports music funeral family date travel].sample,
    age: Faker::Number.between(from: 18, to: 70),
    location: Faker::Address.state,
    daily_rate: Faker::Number.between(from: 10, to: 100),
    pronouns: 'mr',
    bio: 'thew jwefejwk jewfknfjkew fkjwenfgj wekjfbjkew fjkwe fjkwfe fjkew f'
  )
  puts "#{friend.id} created!"
end
