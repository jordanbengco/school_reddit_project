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

StoreItemListing.create(name: 'Hello World Emoticon', description: 'Allows you to type [helloWorld] in your posts to show a custom emoji.', cost: 1)


Article.create(title: 'Hello World!', text: '<b>Hello World, here is an image:</b><br><img src="https://live.staticflickr.com/79/234433736_1b5e1f02cd_z.jpg" width="20%" height="20%"/><br>', author: 'admin')
Article.create(title: 'Custom Emoticon Test', text: '<b>Custom Emoticon:<br> [helloWorld] <br>', author: 'admin')
Article.create(title: 'Youtube Test', text: '<b>Youtube Video:<br> [youtube: dQw4w9WgXcQ] <br>', author: 'user2')

