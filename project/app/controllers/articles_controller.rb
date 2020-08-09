class ArticlesController < ApplicationController
  def index
    if params[:search].blank?
      redirect_to(root_path) and return
    elsif params[:search] == 'top'
      @results = Article.joins(:likes).select('articles.*, COUNT(likes.id) as lc').group('article_id').order('lc DESC')
    elsif params[:search] == 'new'
      @results = Article.order('created_at DESC').all
    else
      @results = Article.all.where("lower(title) LIKE :search", search: "%#{params[:search].downcase}%")
    end
  end
 
  def show
    @article = Article.find_by_id(params[:id])
  end
 
  def new
    @article = Article.new
    @categories = Category.all.map{|c| [ c.name, c.id ]}
  end
 
  def edit
    @article = Article.find_by_id(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create 
    @article = Article.new(article_params) 
    @article.category_id = params[:category_id]

    if @article.save 
      redirect_to @article
    else 
      render 'new'
    end 
  end
 
  def update
    @article = Article.find_by_id(params[:id])
    @article.category_id = params[:category_id]
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find_by_id(params[:id])
    @article.destroy
 
    redirect_to root_path
  end
 
  private
    def set_article
      @article = Article.find_by_id(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text, :author, :time, :edit, :search, :category_id)
    end
end