class ArticlesController < ApplicationController
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
    @articles = Article.all
  end
 
  def show
    @article = Article.find(params[:id])
	#Write to a seperate render string, so the user can continue to edit in the original format
	@article.render_text = handle_custom_tags(@article.text,@article.author)
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create
    @article = Article.new(article_params)

	#Write to a seperate render string, so the user can continue to edit in the original format
	@article.render_text = handle_custom_tags(@article.text,@article.author)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to root_path
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text, :author, :time, :edit, :render_text)
    end
end