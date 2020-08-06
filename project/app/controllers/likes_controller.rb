class LikesController < ApplicationController
  before_action :require_login, :find_article
  helper_method :like
  def create
    if !(already_liked?)
      if already_disliked?
        helpers.undislike
      end
      helpers.like
      redirect_to article_path(@article)
    elsif already_liked?
      helpers.unlike
      redirect_to article_path(@article)
    end
  end


  private

  def like
    #like
    @like = @article.likes.create(user_id: @current_user.id)
    @originalUserName = @article.author
    @originalUser = User.find_by_username(@originalUserName)
    if (@originalUser != @current_user)
      if (@originalUser != nil)
        @originalUser.increment!(:score)
      end
    end
  end

  def already_liked?
    Like.where(user_id: @current_user.id, article_id: params[:article_id]).exists?
  end

  def already_disliked?
    Dislike.where(user_id: @current_user.id, article_id: params[:article_id]).exists?
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

end
