# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p1 = Plant.create(name: 'Aloe Vera', common_names: 'spikius greenthingius',
                  watering_time: 24,
                  sunlight_exposure: 5,
                  summer_environment: 2,
                  winter_environment: 0,
                  description: 'A spiky plant that is green',
                  info_link: 'https://en.wikipedia.org/wiki/Cactus')

user = User.create(username: 'user', password: 'test')

UserPlant.create(user_id: user.id, plant_id: p1.id,
                 custom_name: "User's Custom Cactus",
                 notes: 'This cactus is a very old cactus',
                 last_watered: DateTime.new(2012, 8, 29, 22, 35, 0))
