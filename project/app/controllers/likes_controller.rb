class LikesController < ApplicationController
  before_action :find_article
  def create
    @like = @article.likes.create(user_id: current_user.id, article_id: @article.id)
    redirect_to article_path(@article)
  end
  
  private

  def find_article
    @article = Article.find(params[:article_id])
  end

end
