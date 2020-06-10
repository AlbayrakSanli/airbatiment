require 'faker'

User.destroy_all
Owner.destroy_all
House.destroy_all
City.destroy_all

10.times do
  User.create(
    email: Faker::Internet.email,
    password: "airbatiment"
  )

  Owner.create(
    email: Faker::Internet.email,
    password: "airbatiment"
  )

  City.create(
    name: Faker::Address.city
  )

  House.create(
    title: Faker::Artist.name,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    price_house: rand(100000..500000),
    price_visit: rand(15..100),
    area: rand(60..300),
    room: rand(2..10),
    owner: Owner.all.sample,
    city: City.all.sample
  )
end
