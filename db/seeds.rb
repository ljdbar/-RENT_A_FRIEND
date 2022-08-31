# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

12.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email = Faker::Internet.email(name: name.to_s, separators: ['-'], domain: 'gmail')
  username = email.split('@')[0]
  user = User.create!(username: username, email: email, password: '123456')
  puts "#{user.id} created!"
end

addresses = ['201, 217 Commercial Rd, London E1 2BT',
             'Unit 25, The Concourse Liverpool Street Station, London EC2M 7PY',
             '432, 436 Bethnal Green Rd, London E2 0DJ',
             '6/7 Holborn, London EC1N 2LL',
             '1A Ludgate Hill, London EC4M 7AA',
             '36/42 Kingsland High St, London E8 2JP',
             '251/252 Upper St, London N1 1RU',
             '359/363 Mare St, London E8 1HY',
             '102, 106 The Hwy, London E1W 2BX',
             '24, Cambridge Circus, 84-86 Charing Cross Rd, London WC2H 8AA',
             '291B Oxford St, London W1C 2DT',
             '25/27 Shaftesbury Ave, London W1D 7EQ']
index = 0

User.all.each do |user|
  friend = Friend.create(
    user: user,
    first_name: user.username.split('-')[0].titleize,
    last_name: user.username.split('-')[1].titleize,
    categories: %w[sports music funeral family date travel].sample,
    age: Faker::Number.between(from: 18, to: 70),
    location: addresses[index],
    daily_rate: Faker::Number.decimal(l_digits: 2),
    pronouns: ['He/Him', 'She/Her', 'They/Them'].sample,
    bio: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 50)
  )
  puts "#{friend.id} created!"
  index += 1
end
# 10.times do
#   friend = Friend.create!(
#     user_id: 1,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     categories: %w[sports music funeral family date travel].sample,
#     age: Faker::Number.between(from: 18, to: 70),
#     location: Faker::Address.state,
#     daily_rate: Faker::Number.decimal(l_digits: 2),
#     pronouns: ['He/Him', 'She/Her', 'They/Them'].sample,
#     bio: 'thew jwefejwk jewfknfjkew fkjwenfgj wekjfbjkew fjkwe fjkwfe fjkew f'
#   )
#   puts "#{friend.id} created!"
# end

# https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png
