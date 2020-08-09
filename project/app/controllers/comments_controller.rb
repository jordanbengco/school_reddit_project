class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    # send notification if recipient has them enabled
    @username = @article.author        
    @user = User.find_by username: @username
    if @user.notifications == true
      NewUserMailer.notify_user_post_comment(@article, @comment).deliver_now
    end
    
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:author, :text)
    end
end