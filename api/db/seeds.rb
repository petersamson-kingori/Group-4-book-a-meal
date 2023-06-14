# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding"
roles = Role.create([
    { name: 'Admin' },
    { name: 'Customer' }
])

User.create([
    { username: 'John Doe', email: 'john@example.com', role: roles.first },
    { username: 'John Doe', email: 'john@example.com', role: roles.first }
])
puts "done"