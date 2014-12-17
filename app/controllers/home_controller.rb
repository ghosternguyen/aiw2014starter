class HomeController < ApplicationController
  def index
  	@categories = Category.all
  	@popularposts = Post.all.order('created_at DESC').limit(3)
  	@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
  	@lastupdate = News.all.order('created_at DESC').limit(1)
  end


  def news
  	@news = News.all
  	@categories = Category.all
  	@popularposts = Post.all.order('created_at DESC').limit(3)
  	@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
  end

  def news_detail
	@news_detail = News.find(params[:id])
	@popularposts = Post.all.order('created_at DESC').limit(3)
	@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
	@lastupdate = News.all.order('created_at DESC').limit(1)
	@categories = Category.all
  end

  def search
  end

  def sample
  end
end
