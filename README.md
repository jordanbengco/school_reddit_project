# Access app at http://localhost:8080


## Premade accounts

* admin account have usernames [admin,admin2] where username == password (username: admin, password: admin)
* user accounts with usernames [joe,bob,jordan,ali,rahul,jordon,amy,tim,courtney,nicole] where username == pasword

## Search options:

* Search a post title by inputting a string into the text bar.
* !top will search more posts with the most likes all time
* !new will search more the most recently created posts
* !like # will only show posts with at least min(#,1) likes
* !video will only show posts with embedded video.


## How to use the Cosmetics shop;
* Everytime someone likes a post you made, you get 1 point added to your score.
* You can use this score to purchase items in the cosmetics stroe.


## How to have embedded media in your posts:
* To have custom emoticons in your post, login as an admin user or purchase the emoticons you want from the cosmetics store.
* Use the emoticon tag associated with the purchased emoticon. For example:
    * [helloWorld] or [starEmoji].
* Images are added by simply using the html image tag. For example:
    * \<img src="https://live.staticflickr.com/79/234433736_1b5e1f02cd_z.jpg" width="20%" height="20%"/>
* Youtube videos are added by adding the following to your post [youtube: videoID]. For example:
    * [youtube: dQw4w9WgXcQ].
* To embed audio and video files use [audio: linkToAudioFile] and [video: linkToVideoFile]. For example:
    * [audio: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3]
    * [video: https://www.nps.gov/audiovideo/grca/FE1422E6-155D-451F-67271BA4F8D9DD79/grca-NRsunrise021080_480x270.mp4]


## User Messaging
* A user can send a private message to any other user that is signed up.
* To send a message, click "Inbox" at the top right, click "New Conversation", and then enter the Subject of your conversation,
    the recipient you want to send the message to, and lastly the message itself.
* To test this, log in as two seperate users in seperate browsers, and begin a conversation.
* Messaging implmented using the mailboxer gem: https://github.com/mailboxer/mailboxer


## E-mail Notifications    
* A user can choose to recieve email notifications when they first create their account.
* If enabled, email notifications will be sent for account creation, updating your account, and when someone comments on your post.
* Email notifications implemented using Rails's ActionMailer feature.
* Emails will be sent from "cmpt470group9noreply@gmail.com"




## Tutorials/resources used:
https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application
https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836

Unicorn config in chef file based of of class notes and the following:
https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-unicorn-and-nginx-on-ubuntu-14-04
https://deploy-preview-3018--nostalgic-ptolemy-b01ab8.netlify.app/development/ror/use-unicorn-and-nginx-on-ubuntu-18-04/



