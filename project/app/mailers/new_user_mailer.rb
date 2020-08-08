class NewUserMailer < ApplicationMailer
    # When a new user is created
    def notify_user(user)
        @user = user
        mail(to: @user.email, subject: 'Thank you for signing up!')
    end

    # When an account has been updated
    def notify_user_updated(user)
        @user = user
        mail(to: @user.email, subject: 'Your account has been updated.')
    end

    # When a user comments on your post
    def notify_user_post_comment(article, comment)
        @article = article
        @comment = comment
        @username = @article.author        
        @user = User.find_by username: @username
        mail(to: @user.email, subject: 'Recent activity on your post.')
    end
    

end
