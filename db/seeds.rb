# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Browse through our trips ...'
milano = { destination: 'Milano', price: 280, number_of_people: 2, details: "BlaBla", user_id: 1 }
munich = { destination: 'Munich', price: 490, number_of_people: 4, details: "BlaBlaBla", user_id: 1 }
barcelona = { destination: "Barcelona", price: 260, number_of_people: 6, details: "BliBlaBlub", user_id: 1 }

[milano, munich, barcelona].each do |attributes|
  trip = Trip.create!(attributes)
  puts "Created #{trip.destination}"
end
