class ArticlesController < ApplicationController
  helper_method :handle_custom_tags
  def handle_custom_tags(text)
	text = ActionController::Base.helpers.sanitize(text)

	#find and replace all emoji tags with the proper image. TODO: externalize this logic to read from two DB columns in the store_item table
	#check that the author has access to each emoji
	if current_user.is_admin || current_user.store_items.any?{|item| item.name == 'Hello World Emoticon'}
		text = text.gsub("[helloWorld]",'<img src="/emoticons/HelloWorld.jpg" width="128px" height="128px"/>');
	end
	#find and replace all youtube tags with the proper iframe code
	#[youtube: dQw4w9WgXcQ] input example
	matches = text.scan(/\[youtube:\s\S*\]/)
	youtubeVideoIDs = matches.clone
	youtubeVideoIDs.map! {|id|
		id = id[9..-2].strip
		id = ActionController::Base.helpers.sanitize(id)
	}
	matches.each_with_index do |ytLink, index|
		youtubeIframe = '<iframe width="640" height="480" src="http://www.youtube.com/embed/' + youtubeVideoIDs[index] + '" frameborder="0"></iframe>'
		text = text.gsub(ytLink,youtubeIframe);
	end

	#do the same for video and audio html tags


	return text
  end

  def index
    @articles = Article.all
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create
    @article = Article.new(article_params)

	#TODO: change to write to a seperate render string, so the user can continue to edit in their original format
	@article.text = handle_custom_tags(@article.text)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
	params[:article][:text] = ActionController::Base.helpers.sanitize(params[:article][:text])

	#TODO: change to write to a seperate render string, so the user can continue to edit in their original format
	params[:article][:text] = handle_custom_tags(params[:article][:text])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to root_path
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text, :author, :time, :edit)
    end
end