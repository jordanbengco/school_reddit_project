class NewUserMailer < ApplicationMailer
    def notify_user(user)
        @user = user
        mail(to: @user.email)
    end

end
