class HomeController < ApplicationController
  def index
  end

  def news
  	@news = News.all
  end

  def news_detail
	@news_detail = News.find(params[:id])
  end

  def categories
	@category = Category.all
	@iphone = Category.where(:category_id => '1')
	@ipad = Category.where(:category_id => '2')
	@ipod = Category.where(:category_id => '3')
	@macbook = Category.where(:category_id => '4')
  end

  def search
  end

  def sample
  end
end
