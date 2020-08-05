class LikesController < ApplicationController
  before_action :find_article, :current_user
  def create
    if !(already_liked?)
      #like
      @like = @article.likes.create(user_id: @current_user.id)
      @originalUserName = @article.author
      @originalUser = User.find_by_username(@originalUserName)
      if (@originalUser != @current_user)
        @originalUser.increment!(:score)
      end
      redirect_to article_path(@article)
    elsif already_liked?
      #unlike
      @like = Like.find_by(user_id: @current_user.id)
      @originalUserName = @article.author
      @originalUser = User.find_by_username(@originalUserName)
      if (@originalUser != @current_user)
        @originalUser.decrement!(:score)
      end
      @like.destroy
      redirect_to article_path(@article)
    end
  end


  private

  def already_liked?
    Like.where(user_id: @current_user.id, article_id: params[:article_id]).exists?
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

end
