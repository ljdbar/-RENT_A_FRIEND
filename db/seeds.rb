# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

Booking.destroy_all
Friend.destroy_all
User.destroy_all

people =
  [
    {
      'first_name' => 'Iam',
      'last_name' => 'Zlatan',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 35,
      'location' => 'Omlandsveien 1, 4560 Vanse, Norway',
      'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Zlatan_Ibrahimovic_%2811668830745%29.jpg/466px-Zlatan_Ibrahimovic_%2811668830745%29.jpg'
    },
    {
      'first_name' => 'Megan',
      'last_name' => 'Sheehan',
      'gender' => 'f',
      'pronouns' => 'She/Her',
      'age' => 40,
      'location' => '31 Strand Rd, Londonderry BT48 7BL',
      'image_url' => 'https://pyxis.nymag.com/v1/imgs/384/e16/cb21449a6a43ef7687ad70e0c3974db50b-25-Megan-Rapinoe.rsquare.w700.jpg'
    },
    {
      'first_name' => 'Charlie',
      'last_name' => 'Stiles',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 25,
      'location' => 'Station Rd, York YO24 1AB',
      'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/1200px-Ed_Sheeran-6886_%28cropped%29.jpg'
    },
    {
      'first_name' => 'Alexa',
      'last_name' => 'Sanchez',
      'gender' => 'f',
      'pronouns' => 'She/Her',
      'age' => 35,
      'location' => 'Nerviërsstraat 37, 3000 Leuven, Belgium',
      'image_url' => 'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    },
    {
      'first_name' => 'Harry',
      'last_name' => 'Crane',
      'gender' => 'm',
      'pronouns' => 'They/Them',
      'age' => 35,
      'location' => 'Leibnizstraße 25, 10625 Berlin, Germany',
      'image_url' => 'https://images.unsplash.com/photo-1625241189662-2980453ebffc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1162&q=80'
    },
    {
      'first_name' => 'Sarah',
      'last_name' => 'Legall',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 45,
      'location' => '13 Rue Joseph Turmel, 35700 Rennes, France',
      'image_url' => 'https://images.unsplash.com/photo-1517632202059-6ff8b80d1af1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjA5fHxzbWlsaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
    },
    {
      'first_name' => 'Kirk',
      'last_name' => 'Konnors',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 44,
      'location' => 'Falkevænget 4, 5210 Odense, Denmark',
      'image_url' => 'https://images.unsplash.com/photo-1522529599102-193c0d76b5b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
    },
    {
      'first_name' => 'Petr',
      'last_name' => 'Ilic',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 37,
      'location' => 'High St, Aberlour AB38 9QJ',
      'image_url' => 'https://images.unsplash.com/photo-1512485694743-9c9538b4e6e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA5fHxzbWlsaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
    },
    {
      'first_name' => 'Al',
      'last_name' => 'Bert',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 55,
      'location' => '266 Poyser St, London E2 9RF',
      'image_url' => 'https://images.unsplash.com/photo-1615477081663-8498d3827bc0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    },
    {
      'first_name' => 'Stellar',
      'last_name' => 'Sole',
      'gender' => 'm',
      'pronouns' => 'She/Her',
      'age' => 22,
      'location' => '25 Lower Marsh, London SE1 7RJ',
      'image_url' => 'https://images.unsplash.com/photo-1620216464337-69f08c564cf1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    },
    {
      'first_name' => 'Kim',
      'last_name' => 'Seo',
      'gender' => 'm',
      'pronouns' => 'She/Her',
      'age' => 28,
      'location' => '161 Kingsland Rd, London E2 8AL',
      'image_url' => 'https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=778&q=80'
    },
    {
      'first_name' => 'Summer',
      'last_name' => 'Cole',
      'gender' => 'm',
      'pronouns' => 'She/Her',
      'age' => 25,
      'location' => '87 Rectory Grove, London SW4 0DR',
      'image_url' => 'https://images.unsplash.com/photo-1564460576398-ef55d99548b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    },
    {
      'first_name' => 'Cris',
      'last_name' => 'Tiago',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 33,
      'location' => '3, Chester Court, Albany St, London NW1 4BU',
      'image_url' => 'https://www.hellomagazine.com/imagenes/celebrities/20220530141601/cristiano-ronaldo-toned-torso-sauna-selfie/0-689-676/cristiano-ronaldo-toned-torso-sauna-selfie-t.jpg'
    },
    {
      'first_name' => 'Tim',
      'last_name' => 'Tofan',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 34,
      'location' => '49 Church Rd, London SW13 9HH',
      'image_url' => 'https://images.unsplash.com/photo-1595349384348-3235ad10009a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    },
    {
      'first_name' => 'Ronan',
      'last_name' => 'Ogrady',
      'gender' => 'm',
      'pronouns' => 'He/Him',
      'age' => 28,
      'location' => '57 Whitmore Gardens, London NW10 5HE',
      'image_url' => 'https://images.unsplash.com/photo-1590086783191-a0694c7d1e6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    },
    {
      'first_name' => 'Sean',
      'last_name' => 'Mendes',
      'gender' => 'm',
      'pronouns' => 'They/Them',
      'age' => 25,
      'location' => '89 Turnmill St, London EC1M 5QU',
      'image_url' => 'https://images.unsplash.com/photo-1613419441661-6a5af1751d30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80'
    },
    {
      'first_name' => 'Morfydd',
      'last_name' => 'Astor',
      'gender' => 'm',
      'pronouns' => 'She/her',
      'age' => 31,
      'location' => 'The Vestry, 2A Mill St, London W1S 1FX',
      'image_url' => 'https://images.unsplash.com/photo-1604004215298-793943eef132?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    }
  ]

people.each do |p|
  domain = ['@gmail.com', '@hotmail.com', '@live.com'].sample
  email = "#{p['first_name']}#{p['last_name']}#{domain}"
  # puts email
  username = "#{p['first_name']}_#{p['last_name']}"
  user = User.create!(username: username, email: email, password: '123456')
  puts "User: #{user.id} created!"

  friend = Friend.create(
    user: user,
    first_name: p['first_name'],
    last_name: p['last_name'],
    categories: %w[sports music funeral family date travel].sample,
    age: p['age'],
    location: p['location'],
    daily_rate: Faker::Number.decimal(l_digits: 2),
    pronouns: p['pronouns'],
    bio: "Hi, I'm #{p['first_name'].titleize}, " + Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 50)
  )
  puts "friend: #{friend.id} created!"

  file = URI.open(p['image_url'])
  friend.photo.attach(io: file, filename: "#{user.username}.jpg", content_type: "image/jpg")
  friend.save
  puts "Image created!"
end
