# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Erasing everything..."

User.destroy_all

puts "Creating user..."

user = User.create!(email: "abcd@example.com", password: "123456", first_name: "John", last_name:"Doe")
puts "Created #{user.first_name} #{user.last_name}"

puts "Fetching plants..."

plants_url = "https://houseplantapi.herokuapp.com/all"
plants_serialized = URI.open(plants_url).read
plants_json = JSON.parse(plants_serialized)

plants_json[0..11].map do |plant|
  Plant.create!(user: user,
            temp_min: plant["tempmin"]["celsius"],
            temp_max: plant["tempmax"]["celsius"],
            ideal_light: plant["ideallight"],
            tolerated_light: plant["toleratedlight"],
            common_name: plant["common"][0],
            latin_name: plant["latin"],
            family: plant["family"],
            difficulty_level: rand(0..10),
            avg_rating: (rand(0..5) * rand(0..10)) / rand(1..10))
  puts "Created #{plant["common"][0]}"
end
