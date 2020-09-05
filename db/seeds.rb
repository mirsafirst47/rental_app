require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Broker.destroy_all
Apartment.destroy_all
Neighborhood.destroy_all
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
    Broker.create(
        name: Faker::Name.unique.name
    )
end

10.times do
    Neighborhood.create!(
        name: Faker::Address.city,
        safety_level: Faker::Number.within(range: 1..5)
    )
end

50.times do
    Apartment.create!(
        address: Faker::Address.full_address,
        bedroom_num: Faker::Number.within(range: 1..4), 
        bathroom_num: Faker::Number.within(range: 1..3),
        rent_amount: Faker::Number.within(range: 1000..2000),
        neighborhood_id: Neighborhood.all.sample.id,
        broker_id: Broker.all.sample.id
    )
end


puts "🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵 seeded"
