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

puts 'Creating users'

joel = User.create(full_name: 'joel', email: 'joel@gmail.com', password: 'joelsito')
maxi = User.create(full_name: 'maxi', email: 'maxi@gmail.com', password: 'maxito')
jaime = User.create(full_name: 'jaime', email: 'jaime@gmail.com', password: 'jaimesito')
luca = User.create(full_name: 'luca', email: 'luca@gmail.com', password: 'luquita')

puts 'Failed creating user' if jaime.id.nil?

puts 'Creating garage'

garage_joel = Garage.create(title: 'Garage de Joel', owner: joel, location: "o'higgins 45, Ciudadela", price: 10)
garage_maxi = Garage.create(title: 'Garage de Maxi', owner: maxi, location: 'Av.Santa Fe 2862, capital federal', price: 8)
garage_jaime = Garage.create(title: 'Garage de Jaime', owner: jaime, location: 'ada elfein 2737, San Isidro', price: 25)
garage_luca = Garage.create(title: 'Garage de Luca', owner: luca, location: 'km 38.5 panamerica Ramal pilar, buenos aires', price: 40)

puts 'Attaching photos'


garage_joel.photo.attach(io: foto_joel, filename: 'garage_joel.jpg', content_type: 'image/jpg')
garage_luca.photo.attach(io: foto_luca, filename: 'garage_luca.jpg', content_type: 'image/jpg')
garage_maxi.photo.attach(io: foto_maxi, filename: 'garage_maxi.jpg', content_type: 'image/jpg')
garage_jaime.photo.attach(io: foto_jaime, filename: 'garage_jaime.jpg', content_type: 'image/jpg')

puts 'Creating bookings'

Booking.create(client: jaime, garage: garage_joel, initial_date: DateTime.parse("09/06/2022"), end_date: DateTime.parse("09/07/2022"))
Booking.create(client: luca, garage: garage_jaime, initial_date: DateTime.parse("15/06/2022"), end_date: DateTime.parse("04/07/2022"))
Booking.create(client: maxi, garage: garage_luca, initial_date: DateTime.parse("22/06/2022"), end_date: DateTime.parse("06/07/2022"))
Booking.create(client: joel, garage: garage_maxi, initial_date: DateTime.parse("3/06/2022"), end_date: DateTime.parse("01/07/2022"))

puts 'Booking created correctly'
