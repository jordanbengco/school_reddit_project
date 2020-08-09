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
User.create(username: 'user3', email: 'user3@gmail.com', password: 'user3', password_confirmation: 'user3',is_admin: false, score: 3)

StoreItemListing.create(name: 'Test item 1', description: 'This is test item 1', cost: 1)
StoreItemListing.create(name: 'Test item 2', description: 'This is test item 2', cost: 2)
StoreItemListing.create(name: 'Test item 3', description: 'This is test item 3', cost: 3)

Category.create(name: 'General')
Category.create(name: 'Funny')
Category.create(name: 'Sports')
Category.create(name: 'Gaming')
Category.create(name: 'Pictures')
Category.create(name: 'News')
Category.create(name: 'Entertainment')
Category.create(name: 'Technology')
Category.create(name: 'Discussion')
