# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Fetch existing caterers
caterers = Caterer.all

# Create caterers if none exist
if caterers.empty?
  caterers = Caterer.create([
    { username: 'caterer1', password: 'password1', email: 'caterer1@example.com', business_name: 'Business 1' },
    { username: 'caterer2', password: 'password2', email: 'caterer2@example.com', business_name: 'Business 2' }
  ])
end

# Create menus
menus = Menu.create([
  { caterer: caterers.first, name: 'Meaty Menu', description: 'Description of Menu 1' },
  { caterer: caterers.last, name: 'Veggie Menu', description: 'Description of Menu 2' }
])

# Create menu options
menu_options = MenuOption.create([
  { menu: menus.first, name: 'Option 1', description: 'Description of Option 1', price: 10 },
  { menu: menus.first, name: 'Option 2', description: 'Description of Option 2', price: 15 },
  { menu: menus.last, name: 'Option 3', description: 'Description of Option 3', price: 12 },
  { menu: menus.last, name: 'Option 4', description: 'Description of Option 4', price: 18 }
])

# Create users
users = User.create([
  { username: 'user1', password: 'password1', email: 'user1@example.com' },
  { username: 'user2', password: 'password2', email: 'user2@example.com' }
])

# Create orders
orders = Order.create([
  { user: users.first, menu_option: menu_options.first },
  { user: users.first, menu_option: menu_options.last },
  { user: users.last, menu_option: menu_options.third }
])

# Create reviews
reviews = Review.create([
  { user: users.first, caterer: caterers.first },
  { user: users.last, caterer: caterers.last }
])

puts "Seed data created successfully!"