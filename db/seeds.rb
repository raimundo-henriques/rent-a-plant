# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Erasing everything..."

Booking.destroy_all
User.destroy_all
Plant.destroy_all

puts "Creating user..."

user_1 = User.create!(email: "abcd@example.com", password: "123456", first_name: "John", last_name:"Doe")
puts "Created #{user_1.first_name} #{user_1.last_name}"

user_2 = User.create!(email: "efgh@example.com", password: "123456", first_name: "Dane", last_name:"Joe")
puts "Created #{user_2.first_name} #{user_2.last_name}"


puts "Fetching plants..."

plants_url = "https://houseplantapi.herokuapp.com/all"
plants_serialized = URI.open(plants_url).read
plants_json = JSON.parse(plants_serialized)

puts "Creating plants..."

plant = Plant.new(user: user_1,
                  temp_min: plants_json[0]["tempmin"]["celsius"],
                  temp_max: plants_json[0]["tempmax"]["celsius"],
                  ideal_light: plants_json[0]["ideallight"],
                  tolerated_light: plants_json[0]["toleratedlight"],
                  common_name: plants_json[0]["common"][0],
                  latin_name: plants_json[0]["latin"],
                  family: plants_json[0]["family"],
                  difficulty_level: rand(0..10),
                  address: 'Rua Do Conde De Redondo, 1150-102 Lisbon, Lisboa, Portugal',
                  price: rand(200..5000))

plant_photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Aeschynanthus_Lobbianus_%2849375252662%29.jpg/1561px-Aeschynanthus_Lobbianus_%2849375252662%29.jpg?20200223181951")
plant.photo.attach(io: plant_photo, filename: "#{plant.common_name}.jpg", content_type: "image/jpg")
plant.save!

puts "Created #{plant.common_name}"

plant = Plant.new(user: user_2,
                  temp_min: plants_json[1]["tempmin"]["celsius"],
                  temp_max: plants_json[1]["tempmax"]["celsius"],
                  ideal_light: plants_json[1]["ideallight"],
                  tolerated_light: plants_json[1]["toleratedlight"],
                  common_name: plants_json[1]["common"][0],
                  latin_name: plants_json[1]["latin"],
                  family: plants_json[1]["family"],
                  difficulty_level: rand(0..10),
                  address: 'Avenida De Serpa Pinto 311, 4450-281 Matosinhos, Porto, Portugal',
                  price: rand(200..5000))

plant_photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Adiantum_raddianum_2017_sori.jpg/640px-Adiantum_raddianum_2017_sori.jpg")
plant.photo.attach(io: plant_photo, filename: "#{plant.common_name}.jpg", content_type: "image/jpg")
plant.save!

puts "Created #{plant.common_name}"

plant = Plant.new(user: user_1,
                  temp_min: plants_json[2]["tempmin"]["celsius"],
                  temp_max: plants_json[2]["tempmax"]["celsius"],
                  ideal_light: plants_json[2]["ideallight"],
                  tolerated_light: plants_json[2]["toleratedlight"],
                  common_name: plants_json[2]["common"][0],
                  latin_name: plants_json[2]["latin"],
                  family: plants_json[2]["family"],
                  difficulty_level: rand(0..10),
                  address: 'Avenida Vasco Da Gama, 7520-265 Sines, Set??bal, Portugal',
                  price: rand(200..5000))

plant_photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/23/Aechmea_fasciata2.jpg")
plant.photo.attach(io: plant_photo, filename: "#{plant.common_name}.jpg", content_type: "image/jpg")
plant.save!

puts "Created #{plant.common_name}"

plant = Plant.new(user: user_2,
                  temp_min: plants_json[3]["tempmin"]["celsius"],
                  temp_max: plants_json[3]["tempmax"]["celsius"],
                  ideal_light: plants_json[3]["ideallight"],
                  tolerated_light: plants_json[3]["toleratedlight"],
                  common_name: plants_json[3]["common"][0],
                  latin_name: plants_json[3]["latin"],
                  family: plants_json[3]["family"],
                  difficulty_level: rand(0..10),
                  address: 'Avenida 24 De Julho, 1200-868 Lisbon, Lisboa, Portugal',
                  price: rand(200..5000))

plant_photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/ce/Variegated_Caribbean_Agave_%28Agave_angustifolia_%27Marginata%27%29.jpg")
plant.photo.attach(io: plant_photo, filename: "#{plant.common_name}.jpg", content_type: "image/jpg")
plant.save!

puts "Created #{plant.common_name}"

plant = Plant.new(user: user_1,
                  temp_min: plants_json[4]["tempmin"]["celsius"],
                  temp_max: plants_json[4]["tempmax"]["celsius"],
                  ideal_light: plants_json[4]["ideallight"],
                  tolerated_light: plants_json[4]["toleratedlight"],
                  common_name: plants_json[4]["common"][0],
                  latin_name: plants_json[4]["latin"],
                  family: plants_json[4]["family"],
                  difficulty_level: rand(0..10),
                  address: 'Avenida Da Igreja, 1700-038 Lisbon, Lisboa, Portugal',
                  price: rand(200..5000))

plant_photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/b/b5/Aechmea_caudata_%27Santa_Catarina%27_kz2.jpg")
plant.photo.attach(io: plant_photo, filename: "#{plant.common_name}.jpg", content_type: "image/jpg")
plant.save!

puts "Created #{plant.common_name}"

plant = Plant.new(user: user_2,
                  temp_min: plants_json[6]["tempmin"]["celsius"],
                  temp_max: plants_json[6]["tempmax"]["celsius"],
                  ideal_light: plants_json[6]["ideallight"],
                  tolerated_light: plants_json[6]["toleratedlight"],
                  common_name: plants_json[6]["common"][0],
                  latin_name: plants_json[6]["latin"],
                  family: plants_json[6]["family"],
                  difficulty_level: rand(0..10),
                  address: 'Rua De Serralves, 4150-708 Porto, Porto, Portugal',
                  price: rand(200..5000))

plant_photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Agave_filifera_22.JPG/1600px-Agave_filifera_22.JPG?20130913225203")
plant.photo.attach(io: plant_photo, filename: "#{plant.common_name}.jpg", content_type: "image/jpg")
plant.save!

puts "Created #{plant.common_name}"

plant = Plant.new(user: user_1,
                  temp_min: plants_json[36]["tempmin"]["celsius"],
                  temp_max: plants_json[36]["tempmax"]["celsius"],
                  ideal_light: plants_json[36]["ideallight"],
                  tolerated_light: plants_json[36]["toleratedlight"],
                  common_name: plants_json[36]["common"][0],
                  latin_name: plants_json[36]["latin"],
                  family: plants_json[36]["family"],
                  difficulty_level: rand(0..10),
                  address: 'Avenida Da Boavista, 4100-119 Porto, Porto, Portugal',
                  price: rand(200..5000))

plant_photo = URI.open("https://upload.wikimedia.org/wikipedia/commons/b/bf/Colpfl05.jpg")
plant.photo.attach(io: plant_photo, filename: "#{plant.common_name}.jpg", content_type: "image/jpg")
plant.save!

puts "Created #{plant.common_name}"
