# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usuario1 = User.new(full_name: 'joel', email: 'joel@gmail.com', password: 'joel')
if usuario1.save
  puts "joel created"
else
  puts "joel failed"
end
usuario2 = User.new(full_name: 'maxi', email: 'maxi@gmail.com', password: 'maxi')
if usuario2.save
  puts "maxi created"
else
  puts "maxi failed"
end
usuario3 = User.new(full_name: 'jaime', email: 'jaime@gmail.com', password: 'jaime')
if usuario3.save
  puts "jaime created"
else
  puts "jaime failed"
end
usuario4 = User.new(full_name: 'luca', email: 'luca@gmail.com', password: 'luca')
if usuario4.save
  puts "luca created"
else
  puts "luca failed"
end
Garage.create(owner: usuario1, location:'Garage de joel', photo:, price: 10)
Garage.create(owner: usuario2, location:'Garage de maxi', photo:, price: 8)
Garage.create(owner: usuario3, location:'Garage de jaime', photo:,price: 25)
Garage.create(owner: usuario4, location:'Garage de luca', photo:, price: 40)
