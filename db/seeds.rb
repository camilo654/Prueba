# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ user_name: 'user1', email: 'dfhincapiem@unal.edu.co', first_name: 'User1', last_name: 'U1', telephone: '333333', address: 'cll 3 # 4', city: 'City1' },
                     { user_name: 'user3', email: 'wetelleza@unal.edu.co', first_name: 'User3', last_name: 'U3', telephone: '111111', address: 'kr 12 # 5', city: 'City2' },
                     { user_name: 'user2', email: 'user2@test.com', first_name: 'User2', last_name: 'U2', telephone: '222222', address: 'cll 5 # 78', city: 'City1' }])


rooms = Room.create([{ name: 'sala', user: users[0] }, 
                     { name: 'comedor', user: users[0] },
                     { name: 'habitación', user: users[0] },
                     { name: 'sala', user: users[1] },
                     { name: 'estudio', user: users[1] },
                     { name: 'cocina', user: users[1] },
                     { name: 'dormitorio', user: users[2] },
                     { name: 'garaje', user: users[2] },
                     { name: 'sala', user: users[2] }
                     ])     
                     
outlets = Outlet.create([{ estate: 'true', room: rooms[0]},
                         { estate: 'false', room: rooms[0]},
                         { estate: 'false', room: rooms[0]},
                         { estate: 'false', room: rooms[1]},
                         { estate: 'true', room: rooms[1]},
                         { estate: 'true', room: rooms[1]},
                         { estate: 'false', room: rooms[2]},
                         { estate: 'false', room: rooms[2]},
                         { estate: 'true', room: rooms[3]},
                         { estate: 'false', room: rooms[3]},
                         { estate: 'false', room: rooms[3]},
                         { estate: 'false', room: rooms[4]},
                         { estate: 'true', room: rooms[4]},
                         { estate: 'true', room: rooms[4]},
                         { estate: 'false', room: rooms[4]},
                         { estate: 'false', room: rooms[5]},
                         { estate: 'false', room: rooms[5]},
                         { estate: 'false', room: rooms[5]},
                         { estate: 'false', room: rooms[6]},
                         { estate: 'true', room: rooms[6]},
                         { estate: 'true', room: rooms[7]},
                         { estate: 'false', room: rooms[8]},
                         { estate: 'false', room: rooms[8]},
                         { estate: 'true', room: rooms[7]}
                        ])

categories = Category.create([{ name: 'c1', user: users[0] },
                              { name: 'c2', user: users[0] },
                              { name: 'c3', user: users[0] },
                              { name: 'juegos', user: users[1] },
                              { name: 'peliculas', user: users[1] },
                              { name: 'cocina', user: users[1] },
                              { name: 'c1', user: users[2] },
                              { name: 'c2', user: users[2] },
                              { name: 'c3', user: users[2] },
                              { name: 'c4', user: users[2] }]) 

household_appliances = HouseholdAppliance.create([{ name: 'Tv', electricity_use: '5', user: users[0], outlet_id: outlets[0], category_id: categories[0], consumption: 0 },
                                                   { name: 'dvd', electricity_use: '3', user: users[0], outlet_id: outlets[0], category_id: categories[1], consumption: 0 },
                                                   { name: 'refrigerador', electricity_use: '2', user: users[0], outlet_id: outlets[0], category_id: categories[2], consumption: 0 },
                                                   { name: 'Tv', electricity_use: '3', user: users[1], outlet_id: outlets[12], category_id: categories[3], consumption: 0 },
                                                   { name: 'microondas', electricity_use: '2', user: users[1], outlet_id: outlets[14], category_id: categories[4], consumption: 0 },
                                                   { name: 'equipo de sonido', electricity_use: '3', user: users[1], outlet_id: outlets[13], category_id: categories[5], consumption: 0 },
                                                   { name: 'Tv2', electricity_use: '2', user: users[1], outlet_id: outlets[13], category_id: categories[3], consumption: 0 },
                                                   { name: 'xbox', electricity_use: '3', user: users[1], outlet_id: outlets[15], category_id: categories[3], consumption: 0 },
                                                   { name: 'Tv', electricity_use: '2', user: users[2], consumption: 0 },
                                                   { name: 'dvd', electricity_use: '3', user: users[2], consumption: 0 },
                                                   { name: 'licuadora', electricity_use: '2', user: users[2], consumption: 0 },
                                                   { name: 'cafetera', electricity_use: '3', user: users[0], consumption: 0 },
                                                   { name: 'refrigerador', electricity_use: '2', user: users[2], consumption: 0 },
                                                   { name: 'pc', electricity_use: '5', user: users[1], consumption: 0 }])