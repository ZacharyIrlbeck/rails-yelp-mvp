# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Creating stuff...."

def check_success(restaurant)
  if restaurant.errors.any?
    puts "#{restaurant.errors}"
  else
    puts "all good here"
  end
end

10.times do
  @restaurant = Restaurant.new(name: Faker::Movies::HarryPotter.character,
    address: Faker::Movies::HarryPotter.location,
    category: %w[chinese italian japanese french belgian].sample,
    phone_number: Faker::Movies::HarryPotter.quote)
  @restaurant.save
  check_success(@restaurant)
end


