class ArticlesController < ApplicationController
  before_action :set_categories, only: [:new, :create, :edit]
  helper_method :handle_custom_tags

  def handle_custom_tags(text,author)
	authorUser = User.find_by_username(author)
	authorUserExists = (authorUser != nil)

	text = ActionController::Base.helpers.sanitize(text)
	#find and replace all emoji tags with the proper image. TODO: externalize this logic to read from two DB columns in the store_item table
	#check that the author has access to each emoji
	if (!authorUserExists) || authorUser.is_admin || authorUser.store_items.any?{|item| item.name == 'Hello World Emoticon'}
		text = text.gsub("[helloWorld]",'<img src="/emoticons/HelloWorld.jpg" width="128px" height="128px"/>');
	end
	if (!authorUserExists) || authorUser.is_admin || authorUser.store_items.any?{|item| item.name == 'Star Emoticon'}
		text = text.gsub("[starEmoji]",'<img src="/emoticons/StarEmoji.jpg" width="128px" height="128px"/>');
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
	#Based off of: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video
	#[video: https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4]
	#[video: https://www.nps.gov/audiovideo/grca/FE1422E6-155D-451F-67271BA4F8D9DD79/grca-NRsunrise021080_480x270.mp4]
	matches = text.scan(/\[video:\s\S*\]/)
	videoLinks = matches.clone
	videoLinks.map! {|link|
		link = link[7..-2].strip
		link = ActionController::Base.helpers.sanitize(link)
	}
	matches.each_with_index do |link, index|
		videoHTML = '<video controls width="250"> <source src="' +videoLinks[index]+ '" type="video/mp4"> Sorry, your browser does not support embedded videos.</video>'
		text = text.gsub(link,videoHTML);
	end

	#Based off of:https://developer.mozilla.org/en-US/docs/Web/HTML/Element/audio
	#[audio: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3]
	#[audio: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3]
	matches = text.scan(/\[audio:\s\S*\]/)
	audioLinks = matches.clone
	audioLinks.map! {|link|
		link = link[7..-2].strip
		link = ActionController::Base.helpers.sanitize(link)
	}
	matches.each_with_index do |link, index|
		audioHTML = '<figure><figcaption>Listen to this mp3 file:</figcaption><audio controls src="' + audioLinks[index]+'"> Your browser does not support the <code>audio</code> element.</audio></figure>'
		text = text.gsub(link,audioHTML);
	end

	return text
  end

  def index
    if params[:search].blank?
      redirect_to(root_path) and return
    elsif params[:search] == '!top'
      @results = Article.joins(:likes).select('articles.*, COUNT(likes.id) as lc').group('article_id').order('lc DESC')
    elsif params[:search] == '!new'
      @results = Article.order('created_at DESC').all
    else
      @results = Article.all.where("lower(title) LIKE :search", search: "%#{params[:search].downcase}%")
    end
  end
 
  def show
    @article = Article.find_by_id(params[:id])
	  #Write to a seperate render string, so the user can continue to edit in the original format
	  @article.render_text = handle_custom_tags(@article.text,@article.author)
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
    @article.render_text = handle_custom_tags(@article.text,@article.author)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def create
    @article = Article.new(article_params)
    @article.category_id = params[:category_id]

	  #Write to a seperate render string, so the user can continue to edit in the original format
	  @article.render_text = handle_custom_tags(@article.text,@article.author)

    if @article.save
      redirect_to @article
    else 
      render 'new'
    end 
  end
 
  def update
    @article = Article.find_by_id(params[:id])
    @article.category_id = params[:category_id]

	  params[:article][:text] = ActionController::Base.helpers.sanitize(params[:article][:text])

	  #Write to a seperate render string, so the user can continue to edit in the original format
	  params[:article][:render_text] = handle_custom_tags(params[:article][:text],params[:article][:author])

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

    def set_categories
      @categories = Category.all.map { |c| [c.name, c.id] }
    end

    def article_params
      params.require(:article).permit(:title, :text, :author, :time, :edit, :render_text, :search, :category_id)
    end
end