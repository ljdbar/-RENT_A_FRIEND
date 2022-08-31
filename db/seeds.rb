# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

Friend.destroy_all
User.destroy_all

12.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email = Faker::Internet.email(name: name.to_s, separators: ['-'], domain: 'gmail')
  username = email.split('@')[0]
  user = User.create!(username: username, email: email, password: '123456')
  puts "User: #{user.id} created!"
end

addresses = ['London E1 2BT',
             'London EC2M 7PY',
             'London E2 0DJ',
             'London EC1N 2LL',
             'London EC4M 7AA',
             'London E8 2JP',
             'London N1 1RU',
             'London E8 1HY',
             'London E1W 2BX',
             'London WC2H 8AA',
             'London W1C 2DT',
             'London W1D 7EQ']
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
  puts "friend: #{friend.id} created!"
  index += 1
end

images = ['https://m.media-amazon.com/images/M/MV5BZmE0NzNiNzQtYTVlYS00MjljLWE4MTgtYzYxNjU2NjZkM2M4XkEyXkFqcGdeQXVyNjY5NDgzNjQ@._V1_UY1200_CR85,0,630,1200_AL_.jpg',
          'https://i.pinimg.com/236x/6c/a3/d9/6ca3d9336be0d046ba6989f5db4d9cf0.jpg',
          'https://i.pinimg.com/736x/01/61/6b/01616b7daa1d2ef8846022bffc253d68.jpg',
          'https://pbs.twimg.com/profile_images/1534234298194313218/d-7Hlq5A_400x400.jpg',
          'https://assets.vogue.com/photos/629e20ac35cad83ebf836e5f/master/w_2560%2Cc_limit/GettyImages-1241140057.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Lewis_Hamilton_2016_Malaysia_2.jpg/640px-Lewis_Hamilton_2016_Malaysia_2.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/1200px-Ed_Sheeran-6886_%28cropped%29.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Zlatan_Ibrahimovic_%2811668830745%29.jpg/466px-Zlatan_Ibrahimovic_%2811668830745%29.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Megan_Rapinoe_%2848675274817%29_%28cropped%29.jpg/1200px-Megan_Rapinoe_%2848675274817%29_%28cropped%29.jpg',
          'https://cdn.britannica.com/52/217452-050-76629B63.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/2/2e/Harry_Kane_in_Russia_2.jpg',
          'https://www.cristianoronaldo.com/assets/images/brand_eyewear.jpg?832236']

index = 0

Friend.all.each do |friend|
  full_name = "#{friend.first_name}_#{friend.last_name}"
  file = URI.open(images[index])
  friend.photo.attach(io: file, filename: "#{full_name}.jpg", content_type: "image/jpg")
  friend.save
  puts "Image created!"
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
