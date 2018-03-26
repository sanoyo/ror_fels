# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(name: 'Inah San Juan', email: 'inahsanjuan@gmail.com', password: 'password', admin: true)

# 30.times do |n|
#   Category.create(
#     title: Faker::Commerce.department,
#     description: Faker::Lorem.sentence(3)
#   )
# end

# categories = Category.take(5)

30.times do |n|
	User.create!(name: "User#{n}",
				email: "user#{n}@gmail.com",
				password: "password")
end
