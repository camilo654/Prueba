# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Usuario.create!(email: 'admin@admin.com', nickname: 'UOne', name: 'User One', password: '12345678', tokens: nil)


users = User.create([{ first_name: 'User1', last_name: 'U1', telephone: '333333' }, 
{ first_name: 'User2', last_name: 'U2', telephone: '444444' }])

domiciles = Domicile.create([{ address: 'cll1 #3', city: 'City1', user: users[0] }, 
        { address: 'cll23 #4', city: 'City3', user: users[1] }])

rooms = Room.create([{ name: 'sala', domicile: domiciles[0] }, 
{ name: 'comedor', domicile: domiciles[0] },
{ name: 'habitación 2', domicile: domiciles[0] },
{ name: 'sala', domicile: domiciles[1] }])     

outlets = Outlet.create([{ estate: 'true', room: rooms[0]},
    { estate: 'false', room: rooms[0]},
    { estate: 'false', room: rooms[0]},
    { estate: 'false', room: rooms[1]},
    { estate: 'true', room: rooms[1]},
    { estate: 'true', room: rooms[1]},
    { estate: 'false', room: rooms[2]},
    { estate: 'false', room: rooms[2]},
    { estate: 'true', room: rooms[3]},
    { estate: 'true', room: rooms[3]}])

household_appliances = HouseholdAppliance.create([{ name: 'Tv', electricity_use: '5', outlet: outlets[0]},
                              { name: 'dvd', electricity_use: '3', outlet: outlets[1]},
                              { name: 'fridge', electricity_use: '2', outlet: outlets[2]},
                              { name: 'pc', electricity_use: '5', outlet: outlets[3]}])

categories = Category.create([{ name: 'c1' },
         { name: 'c2' },
         { name: 'c3' },
         { name: 'c4' }])      
         
categorizations = Categorization.create([{ category: categories[0], household_appliance: household_appliances[0]},
                    { category: categories[0], household_appliance: household_appliances[1]}])                              