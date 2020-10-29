# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
City.destroy_all
Potin.destroy_all
Tag.destroy_all

10.times do |user|
    user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence, email: Faker::Internet.email, age: rand(20..40))
    puts user
    user.save

    City.create(name: Faker::Address.city, zip_code: Faker::Address.zip)
end

20.times do
    x = User.first.id
    y = User.last.id
    Potin.create(title: Faker::Lorem.sentence, content: Faker::Lorem.sentence, user_id: rand(x..y))
end

10.times do 
    Tag.create(title: Faker::Lorem.sentence) 
end