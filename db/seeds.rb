# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning the database"

User.destroy_all

10.times do
  name = Faker::Name.first_name
  user = User.create!(
  name: name,
  email: "#{name.downcase}@gmail.com"
  )
  user.save!

  rand(2..6).times do
    task = Task.create(
      name: Faker::Hobby.activity,
      status: rand(0..2),
      user: user
    )
    task.save!
  end
end
