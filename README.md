Access app at http://localhost:8080

default admin account has the username and password of (admin,admin)




Tutorials/resources used:
https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application
https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836

Unicorn config in chef file based of of class notes and the following:
https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-unicorn-and-nginx-on-ubuntu-14-04
https://deploy-preview-3018--nostalgic-ptolemy-b01ab8.netlify.app/development/ror/use-unicorn-and-nginx-on-ubuntu-18-04/

**System Features**


* User Messaging    
    * A user can send a private message to any other user that is signed up.
    * To send a message, click "Inbox" at the top right, click "New Conversation", and then enter the Subject of your conversation,
        the recipient you want to send the message to, and lastly the message itself.
    * To test this, log in as two seperate users in seperate browsers, and begin a conversation.
    * Messaging implmented using the mailboxer gem: https://github.com/mailboxer/mailboxer



* E-mail Notifications    
    * A user can choose to recieve email notifications when they first create their account.
    * If enabled, email notifications will be sent for account creation, updating your account, and when someone comments on your post.
    * Email notifications implemented using Rails's ActionMailer feature.
    * Emails will be sent from "cmpt470group9noreply@gmail.com"
 




