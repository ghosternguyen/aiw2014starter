class HomeController < ApplicationController
  def index
	@posts = Post.all
  end

  def news
  	@news = News.all
  end

  def categories
	@category = Category.all
	@iphone = Category.where(:category_id => '1')
	@ipad = Category.where(:category_id => '2')
	@ipod = Category.where(:category_id => '3')
	@macbook = Category.where(:category_id => '4')
  end

  def news_detail
	@news_detail = News.find(params[:id])
  end

  def post_details
	@post_detail = Post.find(params[:id])
  end

  def search
  end

  def sample
  end
end
