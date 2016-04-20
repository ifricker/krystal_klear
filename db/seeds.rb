# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Rake::Task["db:drop"].invoke
Rake::Task["db:create"].invoke
Rake::Task["db:migrate"].invoke

# CREATE ADMIN
User.create!({
    name: "admin",
    email: "admin@krystalklear.com",
    password: "123456",
    phone: "123456789",
    admin: true
    })

# CREATE STANDARD USERS
10.times do
  User.create!({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456",
    phone: "123456789",
    admin: false
    })
end

# CREATE CLIENTS
50.times do
  Client.create!({
    business_name: Faker::Company.name,
    street_address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    neighborhood: Faker::Address.city,
    contact_phone: Faker::PhoneNumber.cell_phone,
    contact_email: Faker::Internet.email
    })
end

# CREATE ROUTES

10.times do
  Route.create!({
    name: Faker::Address.street_address,
    description: Faker::Lorem.sentence
    })
end

# CREATE JOBS
100.times do
  Job.create!({
    name: Faker::Company.name,
    description: Faker::Lorem.sentence,
    frequency: ['1','1','1','1','1','2','2','2','4','8','12'].sample,
    estimated_price: Faker::Commerce.price,
    client_id: rand(1..50),
    route_id: rand(1..10)
    })
end
