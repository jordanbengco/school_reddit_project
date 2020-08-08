# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'admin', email: 'admin@gmail.com', password: 'admin', password_confirmation: 'admin',is_admin: true, score: 100)
User.create(username: 'admin2', email: 'admin2@gmail.com', password: 'admin2', password_confirmation: 'admin2',is_admin: true, score: 100)

User.create(username: 'user1', email: 'user1@gmail.com', password: 'user1', password_confirmation: 'user1',is_admin: false, score: 10)
User.create(username: 'user2', email: 'user2@gmail.com', password: 'user2', password_confirmation: 'user2',is_admin: false, score: 2)
User.create(username: 'user3', email: 'user3@gmail.com', password: 'user3', password_confirmation: 'user3',is_admin: false, score: 3)

#StoreItemListing.create(name: 'Test item 1', description: 'This is test item 1', cost: 1)
StoreItemListing.create(name: 'Hello World Emoticon', description: 'Allows you to type [helloWorld] in your posts to show a custom emoji.', cost: 1)
StoreItemListing.create(name: 'Star Emoticon', description: 'Allows you to type [starEmoji] in your posts to show a star emoji.', cost: 1)

Article.create(title: 'Hello World!', text: '<b>Hello World, here is an image:</b><br><img src="https://live.staticflickr.com/79/234433736_1b5e1f02cd_z.jpg" width="20%" height="20%"/><br>', author: 'admin')
Article.create(title: 'Custom Emoticon Test', text: '<b>Custom Emoticons:<br> [helloWorld] <br>[starEmoji] <br>', author: 'admin')
Article.create(title: 'Youtube Test', text: '<b>Youtube Video:<br> [youtube: dQw4w9WgXcQ] <br>', author: 'user2')

Article.create(
title: 'Audio and Video Test', 
text: 
'[video: https://www.nps.gov/audiovideo/grca/FE1422E6-155D-451F-67271BA4F8D9DD79/grca-NRsunrise021080_480x270.mp4]
[video: https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4]
[audio: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3]
[audio: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3]',
author: 'user3')

ytVideoArticle = Article.find_by_title('Youtube Test')
adminUser = User.find_by_username('admin')
Like.create(article_id: ytVideoArticle.id,user_id:adminUser.id)

