# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username: 'admin', email: 'admin@gmail.com', password: 'admin', password_confirmation: 'admin',is_admin: true, score: 100)

User.create(username: 'user1', email: 'user1@gmail.com', password: 'user1', password_confirmation: 'user1',is_admin: false, score: 1)
User.create(username: 'user2', email: 'user2@gmail.com', password: 'user2', password_confirmation: 'user2',is_admin: false, score: 2)

