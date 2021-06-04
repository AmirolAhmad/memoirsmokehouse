# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
["Perlis",
  "Kedah",
  "P. Pinang",
  "Perak",
  "Kelantan",
  "Terengganu",
  "Pahang",
  "Selangor",
  "W.P Kuala Lumpur",
  "Putrajaya",
  "Melaka",
  "N. Sembilan",
  "Johor",
  "Sarawak",
  "Sabah",
  "W.P Labuan"].each do |name|
   State.find_or_create_by(name: name)
 end