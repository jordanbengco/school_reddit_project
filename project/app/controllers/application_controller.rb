class ApplicationController < ActionController::Base
  helper_method :current_user, :unlike, :undislike

  # Keys used by bootstrap for pop-ups
  add_flash_types :danger, :info, :warning, :success

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  private

  def unlike
    #unlike
    @like = Like.find_by(user_id: @current_user.id, article_id: @article)
    @originalUserName = @article.author
    @originalUser = User.find_by_username(@originalUserName)
    if (@originalUser != @current_user)
      if (@originalUser != nil)
        @originalUser.decrement!(:score)
      end
    end
    @like.destroy
  end

  def undislike
    #undislike
    @dislike = Dislike.find_by(user_id: @current_user.id, article_id: @article)
    @dislike.destroy
  end

  def require_login
    helpers.current_user
     if(@current_user == nil)
       flash[:error] = "You must be logged in to access this section"
       redirect_to new_session_url # halts request cycle
     end
   end
end
