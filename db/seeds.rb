# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  user=User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
end
User.order(:created_at).take(8).map{ |usr| usr.update(role: 1) }
User.last.update(role: 2)

10.times do
  organization=Organization.new(
    name: Faker::Company.name,
    adress: Faker::Address.street_address,
    opening_time: '9:00',
    closing_time: '23:00',
    user_id: User.owner.sample.id
  )
end