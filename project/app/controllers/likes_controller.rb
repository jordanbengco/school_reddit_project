class LikesController < ApplicationController
  before_action :find_article
  def create
    if !(already_liked?)
      #like
      @like = @article.likes.create(user_id: current_user.id, article_id: @article.id)
      @originalUser = @article.author
      @originalUserId = User.find_by_username(@originalUser)
      @originalUserId.increment!(:score)
      redirect_to article_path(@article)
    elsif already_liked?
      #unlike
      @like = Like.find_by(params[user_id: current_user.id, article_id: @article.id])
      @originalUser = @article.author
      @originalUserId = User.find_by_username(@originalUser)
      @originalUserId.decrement!(:score)
      @like.destroy
      redirect_to article_path(@article)
    end
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, article_id: @article.id).exists?
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

end
