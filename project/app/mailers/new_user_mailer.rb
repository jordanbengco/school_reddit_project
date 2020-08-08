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

end
