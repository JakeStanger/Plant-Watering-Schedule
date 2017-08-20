t1 = Tag.create(name: 'Cacti')
t2 = Tag.create(name: 'Spiky')
t3 = Tag.create(name: 'Test')

p1 = Plant.create(name: 'Cactus', common_names: 'spikius greenthingius',
                  watering_time: 24,
                  sunlight_exposure: 5,
                  summer_environment: 2,
                  winter_environment: 0,
                  description: 'A spiky plant that is green',
                  info_link: 'https://en.wikipedia.org/wiki/Cactus')

p2 = Plant.create(name: 'TEST', common_names: 'test, test2, test3',
                  watering_time: 2400,
                  sunlight_exposure: 3,
                  summer_environment: 1,
                  winter_environment: 2,
                  description: 'A test plant',
                  info_link: 'https://en.wikipedia.org/wiki/Test')

p1.tags << [t1, t2]
p2.tags << [t2, t3]

# user = User.create(username: 'user', password: 'test')
#
# UserPlant.create(user_id: user.id, plant_id: p1.id,
#                  custom_name: "User's Custom Cactus",
#                  notes: 'This cactus is a fairly old cactus',
#                  last_watered: DateTime.new(2012, 8, 29, 22, 35, 0))
