# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin

# Fetch existing caterers
caterers = Caterer.all

# Create caterers if none exist
if caterers.empty?
  caterers = Caterer.create([
    { username: 'caterer1', password: 'password1', email: 'caterer1@example.com', business_name: 'Business 1' },
    { username: 'caterer2', password: 'password2', email: 'caterer2@example.com', business_name: 'Business 2' }
  ])
end


# Define the menu names and descriptions for each day of the week
menu_data = [
  { name: 'Monday Menu', description: 'Description of Monday Menu' },
  { name: 'Tuesday Menu', description: 'Description of Tuesday Menu' },
  { name: 'Wednesday Menu', description: 'Description of Wednesday Menu' },
  { name: 'Thursday Menu', description: 'Description of Thursday Menu' },
  { name: 'Friday Menu', description: 'Description of Friday Menu' },
  { name: 'Saturday Menu', description: 'Description of Saturday Menu' },
  { name: 'Sunday Menu', description: 'Description of Sunday Menu' }
]

# Find the index of the current day (0 - Monday, 1 - Tuesday, etc.)
current_day_index = Time.zone.now.wday

# Get the menu data for the current day
current_menu_data = menu_data[current_day_index]

# Find or create the menu for the current day
menu = Menu.find_or_create_by(caterer: caterers.first, name: current_menu_data[:name]) do |m|
  m.description = current_menu_data[:description]
end

# Create menu options


# Create users
users = User.create([
  { username: 'user1', password: 'password1', email: 'user1@example.com' },
  { username: 'user2', password: 'password2', email: 'user2@example.com' }
])
=end



puts "Seed data created successfully!"