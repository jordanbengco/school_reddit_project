class MainController < ApplicationController
  def index
    @articles = Article.all
    config.time_zone = Time.now.zone
  end
end
