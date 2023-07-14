# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

require 'faker'

# Book.create(
#   title: "Sample Book 1",
#   author: "Author 1",
#   price: 19.99,
#   published_date: Date.today - 1.year,
#   genre: "Fiction",
#   publisher: "Publisher 1",
#   cover_image: "cover1.jpg",
#   language: "English",
#   isbn: "1234567890"
# )

# Book.create(
#   title: "Sample Book 2",
#   author: "Author 2",
#   price: 24.99,
#   published_date: Date.today - 6.months,
#   genre: "Non-Fiction",
#   publisher: "Publisher 2",
#   cover_image: "cover2.jpg",
#   language: "English",
#   isbn: "0987654321"
# )

# Book.create(
#   title: "Sample Book 3",
#   author: "Author 3",
#   price: 20.99,
#   published_date: Date.today - 4.months,
#   genre: "Horror",
#   publisher: "Publisher 6",
#   cover_image: "cover2.jpg",
#   language: "English",
#   isbn: "0987652121"
# )

# 50.times do |n|
#   title = Faker::Name.title
#   last_name = Faker::Name.last_name
#   email = Faker::Internet.email
#   password = Faker::Internet.password(min_length: 8, max_length: 20)
#   Book.create(
#     title: "Sample Book #{n+1}",
#     author: "Author #{n+1}",
#     price: rand(10.0..100.0).round(2),
#     published_date: Date.today - rand(0..365).days,
#     genre: "Genre #{n+1}",
#     publisher: "Publisher #{n+1}",
#     cover_image: "cover#{n+1}.jpg",
#     language: "English",
#     isbn: rand(1000000000..9999999999).to_s
#   )
# end

# Create sample books
50.times do |n|
  Book.create(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    # image: "image#{n+1}.jpg",
    published: Faker::Book.publisher,
    author_id: n+1,
    price: Faker::Commerce.price(range: 10.0..100.0),
    published_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    genre: Faker::Book.genre,
    publisher: Faker::Book.publisher,
    language: "English",
    # author: Faker::Book.author,
    isbn: Faker::Number.unique.number(digits: 10).to_s
  )
end

# For author creation in rails seed 

# 50.times do |n|
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = Faker::Internet.email
#   password = Faker::Internet.password(min_length: 8, max_length: 20)

#   Author.create(
#     first_name: first_name,
#     last_name: last_name,
#     email: email,
#     password: password,
#     confirmation_password: password
#   )
# end

# # Create sample authors
# 50.times do |n|
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = Faker::Internet.email
#   password = Faker::Internet.password(min_length: 8, max_length: 20)

#   Author.create(
#     first_name: first_name,
#     last_name: last_name,
#     email: email,
#     password: password
#   )
# end


# Create sample books
# 50.times do |n|
#   book = Book.new(
#     title: Faker::Book.title,
#     description: Faker::Lorem.paragraph(sentence_count: 5),
#     image: "image#{n+1}.jpg",
#     published: Faker::Book.publisher,
#     author_id: n+1,
#     price: Faker::Commerce.price(range: 10.0..100.0),
#     published_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
#     genre: Faker::Book.genre,
#     publisher: Faker::Book.publisher,
#     language: "English",
#     isbn: Faker::Number.unique.number(digits: 10).to_s
#   )

#   # Save the book and display its information
#   if book.save
#     puts "Created book: #{book.title}"
#   else
#     puts "Failed to create book: #{book.errors.full_messages.join(', ')}"
#   end
# end


50.times do |n|
  Tag.create(name: Faker::Lorem.word)
end

