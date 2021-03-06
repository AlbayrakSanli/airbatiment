require 'faker'

User.destroy_all
Owner.destroy_all
House.destroy_all
City.destroy_all
Appointment.destroy_all
Availability.destroy_all

10.times do
  User.create(
    email: Faker::Internet.email,
    password: "airbatiment",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
  )

  Owner.create(
    email: Faker::Internet.email,
    password: "airbatiment",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
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
    city: Faker::Address.city
  )
end

House.all.each do |house|
  Availability.create(house_id: house.id, duration: 60, date_start: "2020-06-22 10:00:00")
  Availability.create(house_id: house.id, duration: 60, date_start: "2020-06-22 12:00:00")
  Availability.create(house_id: house.id, duration: 60, date_start: "2020-06-22 14:00:00")
  Availability.create(house_id: house.id, duration: 60, date_start: "2020-06-23 10:00:00")
  Availability.create(house_id: house.id, duration: 60, date_start: "2020-06-24 10:00:00")
end