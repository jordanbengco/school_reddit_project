class DislikesController < ApplicationController
  before_action :require_login, :find_article
  helper_method :dislike

  def create
    if !(already_disliked?)
      if already_liked?
        helpers.unlike
      end
      helpers.dislike
      redirect_to article_path(@article)
    elsif already_disliked?
      helpers.undislike
      redirect_to article_path(@article)
    end
  end


  private

  def dislike
    #dislike
    @dislike = @article.dislikes.create(user_id: @current_user.id)
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
