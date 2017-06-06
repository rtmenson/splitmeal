# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


menu_items = [
  {
    :name =>  "French Fries",
    :image => "https://www.splendidtable.org/sites/default/files/styles/lede_image/public/french-fries.jpg?itok=s1bQO8Mt",
    :price => 6
  },
  {
    :name => "Coke",
    :image => "http://www.coca-colaproductfacts.com/content/dam/productfacts/us/productDetails/ProductImages/Coke_12oz.png",
    :price => 2

  },
  {
    :name => "Burger",
    :image => "http://www.tellusaboutus.com/comments/images/BK-WebComment/BB_WHOPPER-v1.png",
    :price => 10
  },
  {
  :name => "Salad",
  :image => "http://jetspizza.com/dbphotos/display/3ac462ac8961d463b8d5a765ce7535f1/664/410",
  :price => 7

  }
]

menu_items.each do |item|
    menu_item = MenuItem.new(item)
    menu_item.save
end

puts "There are now #{MenuItem.count} menu items in the database."

party = Party.new
party.save

puts "There are now #{Party.count} parties in the database."

diners = ["alice", "bob", "carol"]

diners.each do |diner|
  user = User.new
  user.username = diner
  user.email = "#{diner}@example.com"
  user.party_id = party.id
  user.password = "12341234"
  user.save
end

users = User.all

party.size = users.size
party.save

puts "There are now #{User.count} users in the database."




users.each do |user|
  rand(users.size).times do
    order = Order.new
    order.menu_item_id = rand(menu_items.size)-1
    order.party_id = party.id
    order.save
  end
end

puts "There are now #{Order.count} orders in the database."
