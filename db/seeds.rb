# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create admin
User.create(email:'admin@admin.com', password:'123456', admin:true)

# Create users
10.times do |x|
  fake_email = Faker::Internet.email(domain: 'gmail.com')
  fake_password = '123456'
  User.create(email:fake_email, password:fake_password)
end

#Create categories
10.times do |x|
  fake_title = Faker::App.name
  Category.create(title:fake_title)
end

# Take all categories
categories = Category.all

# Create movies using random categories
30.times do|x|
  fake_title = Faker::Movie.title
  fake_body = Faker::Movie.quote
  random_category = categories[rand(categories.length)]
  Movie.create(title:fake_title, body:fake_body, category:random_category)
end

#Create ratings
movies = Movie.all
users = User.all

movies.each do |m|
  Rating.create(movie:m, user:users[rand(users.length), value:rand(10)])
end