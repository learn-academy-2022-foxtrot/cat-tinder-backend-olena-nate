# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cats = [
  {
    name: 'Rengar',
    age: 10,
    enjoys: 'Sleeping and begging for food',
    image: 'https://s.wsj.net/public/resources/images/BN-FX848_catsle_G_20141208233340.jpg'
  },
  {
    name: 'Grant',
    age: 13,
    enjoys: 'Loves to play and eat food',
    image: 'https://assets-jpcust.jwpsrv.com/thumbnails/ehngeaer-720.jpg'
  },
  {
    name: 'Max',
    age: 13,
    enjoys: 'Sleeping and playing with other cats',
    image: 'https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg'
  }
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end