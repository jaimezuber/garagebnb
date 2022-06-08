# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

foto_joel = URI.open('https://st.depositphotos.com/1041088/4500/i/600/depositphotos_45004175-stock-photo-empty-garage.jpg')
foto_jaime = URI.open('https://st2.depositphotos.com/3418487/6470/i/600/depositphotos_64704175-stock-photo-background.jpg')
foto_maxi = URI.open('https://static8.depositphotos.com/1524415/1033/i/600/depositphotos_10339645-stock-photo-clean-garage.jpg')
foto_luca = URI.open('https://static7.depositphotos.com/1138869/775/i/600/depositphotos_7755045-stock-photo-underground-parking.jpg')

usuario1 = User.new(full_name: 'joel', email: 'joel@gmail.com', password: 'joelsito')
if usuario1.save
  puts "joel created"
else
  puts usuario1.errors.messages
end
usuario2 = User.new(full_name: 'maxi', email: 'maxi@gmail.com', password: 'maxito')
if usuario2.save
  puts "maxi created"
else
  puts usuario2.errors
end
usuario3 = User.new(full_name: 'jaime', email: 'jaime@gmail.com', password: 'jaimesito')
if usuario3.save
  puts "jaime created"
else
  puts "jaime failed"
end
usuario4 = User.new(full_name: 'luca', email: 'luca@gmail.com', password: 'luquita')
if usuario4.save
  puts "luca created"
else
  puts "luca failed"
end
garage_joel = Garage.create(title: 'Garage de Joel', owner: usuario1, location:'Quilmes', price: 10)
garage_maxi = Garage.create(title: 'Garage de Maxi', owner: usuario2, location:'Palermo', price: 8)
gargae_jaime = Garage.create(title: 'Garage de Jaime', owner: usuario3, location:'San Isidro', price: 25)
garage_luca = Garage.create(title: 'Garage de Luca', owner: usuario4, location:'Pilar', price: 40)

garage_joel.photo.attach(io: foto_joel, filename: 'garage_joel.jpg', content_type: 'image/jpg')
garage_luca.photo.attach(io: foto_luca, filename: 'garage_luca.jpg', content_type: 'image/jpg')
garage_maxi.photo.attach(io: foto_maxi, filename: 'garage_maxi.jpg', content_type: 'image/jpg')
gargae_jaime.photo.attach(io: foto_jaime, filename: 'garage_jaime.jpg', content_type: 'image/jpg')
