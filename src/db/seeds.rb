# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

50.times do 
  User.create!(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end 

10.times do 
  Owner.create!(
    user_id: Faker::Number.between(from: 1, to: 50)
  )
end 

50.times do
  Vehicle.create!(
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    body_type: Faker::Vehicle.car_type,
    door_count: Faker::Vehicle.doors,
    seat_count: Faker::Number.between(from: 1, to: 8),
    available: true,
    owner_id: Faker::Number.between(from: 1, to: 25)
  )
end

20.times do
  Booking.create!(
    user_id: Faker::Number.between(from: 1, to: 50),
    vehicle_id: Faker::Number.between(from: 1, to: 50)
  )
end 