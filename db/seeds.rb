# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  Item.create(name: "Item #{i}", owner: "Author #{i}", description: "Description #{i}", image_url: "https://picsum.photos/50/50?random=#{i}", publication_date: "01-01-2000", price: 1)
end