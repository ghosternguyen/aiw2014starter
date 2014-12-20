class HomeController < ApplicationController
	def index
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(5)
		@posts = Post.all.order("created_at DESC")
		@popularposts = Post.all.order('created_at DESC').limit(3)
		@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
		@news = News.all
		@firstnews = @news.order("created_at desc").limit(1)
		@under1stnews = @news.order("created_at desc").limit(5).offset(1)
		@lastupdate = News.all.order('created_at DESC').limit(1)
		@slide = Slide.all
		@firstslide = @slide.order("created_at desc").limit(1)
		@under1stslide = @slide.order("created_at desc").offset(1)
		
	end

	def post_detail
		@post_detail = Post.find(params[:id])
	end


	def news
		@news = News.all
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(5)
		@popularposts = Post.all.order('created_at DESC').limit(3)
		@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
	end

	def news_detail
		@news_detail = News.find(params[:id])
		@popularposts = Post.all.order('created_at DESC').limit(3)
		@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
		@lastupdate = News.all.order('created_at DESC').limit(1)
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(5)
	end

	def search
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(5)
		@popularposts = Post.all.order('created_at DESC').limit(3)
		@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
		if params[:search]
			@posts = Post.search(params[:search])
		else
			@posts = Post.all.order("created_at DESC")

		end
	end

	def sample
		@popularposts = Post.all.order('created_at DESC').limit(3)
		@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
		@lastupdate = News.all.order('created_at DESC').limit(1)
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(5)
	end

	def category
		@men_cat = Category.find(params[:category_id])
	end

	def new
		@contact = Contact.new
	end

end
