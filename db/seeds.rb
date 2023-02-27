# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

Bike.destroy_all
User.destroy_all

#user1 = User.create!(email: "user1@mail.com", password: "123456", first_name: "David", last_name: "Carmo")

users = []

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 10)
  )
  user.save! # Save the user instance
  users << user # Add the user instance to the array
end

200.times do
  bike = Bike.new(
    brand: Faker::Vehicle.manufacture,
    category: ["City", "Race", "MTB", "Gravel", "eBike"].sample,
    color: Faker::Vehicle.color,
    size: ["51", "53", "55", "57", "60"].sample,
    price: Faker::Number.between(from: 0.0, to: 10.0),
    address: Faker::Address.city,
    user: users.sample
  )
  file = URI.open('https://loremflickr.com/json/g/800/600/bicycle')
  bike.photo.attach(io: file, filename: "picture")
  bike.save!
end

#what we can do to get some bikes brand name is to find an API that provide us with real data
#general notes: the seeds' purposes is to have data we can work with and dont have to create manually
