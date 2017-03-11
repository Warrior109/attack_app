# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  User.create(
    nickname: Faker::Internet.user_name + i.to_s,
    ip: Faker::Internet.public_ip_v4_address,
    hp: rand(50..900),
    attack: rand(1..100),
    defence: rand(0..99)
  )
end
