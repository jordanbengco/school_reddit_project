# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'admin', email: 'admin@fakeemail.com', password: 'admin', password_confirmation: 'admin',is_admin: true, score: 100)
User.create(username: 'admin2', email: 'admin2@fakeemail.com', password: 'admin2', password_confirmation: 'admin2',is_admin: true, score: 100)

User.create(username: 'joe', email: 'joe@fakeemail.com', password: 'joe', password_confirmation: 'joe',is_admin: false, score: 10)
User.create(username: 'bob', email: 'bob@fakeemail.com', password: 'bob', password_confirmation: 'bob',is_admin: false, score: 6)
User.create(username: 'jordan', email: 'jordan@fakeemail.com', password: 'jordan', password_confirmation: 'jordan',is_admin: false, score: 2)
User.create(username: 'ali', email: 'ali@fakeemail.com', password: 'ali', password_confirmation: 'ali',is_admin: false, score: 2)
User.create(username: 'rahul', email: 'rahul@fakeemail.com', password: 'rahul', password_confirmation: 'rahul',is_admin: false, score: 2)
User.create(username: 'jordon', email: 'jordon@fakeemail.com', password: 'jordon', password_confirmation: 'jordon',is_admin: false, score: 2)
User.create(username: 'amy', email: 'amy@fakeemail.com', password: 'amy', password_confirmation: 'amy',is_admin: false, score: 9)
User.create(username: 'tim', email: 'tim@fakeemail.com', password: 'tim', password_confirmation: 'tim',is_admin: false, score: 7)
User.create(username: 'courtney', email: 'courtney@fakeemail.com', password: 'courtney', password_confirmation: 'courtney',is_admin: false, score: 15)
User.create(username: 'nicole', email: 'nicole@fakeemail.com', password: 'nicole', password_confirmation: 'nicole',is_admin: false, score: 3)

#StoreItemListing.create(name: 'Test item 1', description: 'This is test item 1', cost: 1)
StoreItemListing.create(name: 'Hello World Emoticon', description: 'Allows you to type [helloWorld] in your posts to show a custom emoji.', cost: 1)
StoreItemListing.create(name: 'Star Emoticon', description: 'Allows you to type [starEmoji] in your posts to show a star emoji.', cost: 1)

Category.create(name: 'General') #1
Category.create(name: 'Funny') #2
Category.create(name: 'Sports') #3
Category.create(name: 'Gaming') #4
Category.create(name: 'Pictures') #5
Category.create(name: 'News') #6
Category.create(name: 'Entertainment') #7
Category.create(name: 'Technology') #8
Category.create(name: 'Discussion') #9

Article.create(title: 'Hello World!', text: '<b>Hello World, here is an image:</b><br><img src="https://live.staticflickr.com/79/234433736_1b5e1f02cd_z.jpg" width="20%" height="20%"/><br>', author: 'admin', category_id: '1', created_at: '2020-08-09 03:51:23.082128')
Article.create(title: 'Custom Emoticon Test', text: '<b>Custom Emoticons:<br> [helloWorld] <br>[starEmoji] <br>', author: 'admin', category_id: '1', created_at: '2020-08-09 04:23:45.082128')
Article.create(title: 'Youtube Test', text: '<b>Youtube Video:<br> [youtube: dQw4w9WgXcQ] <br>', author: 'bob', category_id: '7', created_at: '2020-08-08 16:54:33.322128')
Article.create(title: 'Go Canucks!', text: 'I cannot believe we qualified for the playoffs! Go Canucks Go!', author: 'jordan', category_id: '3', created_at: '2020-08-09 01:12:32.082128')
Article.create(title: 'Why did the chicken cross the road?', text: 'To get to the other side', author: 'nicole', category_id: '2', created_at: '2020-08-09 03:53:25.082128')
Article.create(title: 'How is everyone finding school changes due to coronavirus?', text: 'Easier or harder?', author: 'tim', category_id: '9', created_at: '2020-08-09 02:33:44.082128')
Article.create(title: 'I think UBC is better than SFU!', text: 'Why the dislikes guys?', author: 'bob', edit: 'bob', category_id: '9', created_at: '2020-08-08 22:33:43.082128')

Article.create(title: 'Audio and Video Test', text: '[video: https://www.nps.gov/audiovideo/grca/FE1422E6-155D-451F-67271BA4F8D9DD79/grca-NRsunrise021080_480x270.mp4]
[video: https://www.w3schools.com/html/mov_bbb.mp4][audio: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3][audio: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3]',
author: 'user3', category_id: '1')

a_YouTube = Article.find_by_title('Youtube Test')
a_Canucks = Article.find_by_title('Go Canucks!')
a_HelloWorld = Article.find_by_title('Hello World!')
a_Chicken = Article.find_by_title('Why did the chicken cross the road?')
a_UBC = Article.find_by_title('I think UBC is better than SFU!')

u_admin = User.find_by_username('admin')
u_bob = User.find_by_username('bob')
u_nicole = User.find_by_username('nicole')
u_tim = User.find_by_username('tim')
u_courtney = User.find_by_username('courtney')
u_amy = User.find_by_username('amy')

Like.create(article_id: a_YouTube.id, user_id:u_admin.id)
Like.create(article_id: a_YouTube.id, user_id:u_tim.id)
Dislike.create(article_id: a_YouTube.id, user_id:u_amy.id)

Like.create(article_id: a_Canucks.id, user_id:u_bob.id)
Like.create(article_id: a_Canucks.id, user_id:u_tim.id)
Like.create(article_id: a_Canucks.id, user_id:u_courtney.id)
Like.create(article_id: a_Canucks.id, user_id:u_amy.id)

Like.create(article_id: a_HelloWorld.id, user_id:u_admin.id)
Like.create(article_id: a_HelloWorld.id, user_id:u_courtney.id)

Like.create(article_id: a_Chicken.id, user_id:u_admin.id)
Like.create(article_id: a_Chicken.id, user_id:u_bob.id)
Dislike.create(article_id: a_Chicken.id, user_id:u_tim.id)
Dislike.create(article_id: a_Chicken.id, user_id:u_amy.id)

Dislike.create(article_id: a_UBC.id, user_id:u_bob.id)
Dislike.create(article_id: a_UBC.id, user_id:u_nicole.id)
Dislike.create(article_id: a_UBC.id, user_id:u_courtney.id)