class HomeController < ApplicationController
	def index
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(6)
		@posts = Post.all.limit(6).shuffle
		@popularposts = Post.all.limit(3).shuffle
		@olderposts = Post.all.order('created_at DESC').limit(6).offset(1)
    	@recentposts = @olderposts.limit(3)
		@news = News.all
		@firstnews = @news.order("created_at desc").limit(1)
		@under1stnews = @news.order("created_at desc").limit(4).offset(1)
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
		@bar_cat = @men_cat.limit(6)
		@popularposts = Post.all.limit(3).shuffle
		@olderposts = Post.all.order('created_at DESC').limit(6).offset(1)
    	@recentposts = @olderposts.limit(3)
	end

	def news_detail
		@news_detail = News.find(params[:id])
		@popularposts = Post.all.limit(3).shuffle
		@olderposts = Post.all.order('created_at DESC').limit(6).offset(1)
    	@recentposts = @olderposts.limit(3)
		@lastupdate = News.all.order('created_at DESC').limit(1)
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(6)
	end

	def search
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(6)
		@popularposts = Post.all.limit(3).shuffle
		@olderposts = Post.all.order('created_at DESC').limit(6).offset(1)
    	@recentposts = @olderposts.limit(3)
		if params[:search]
			@posts = Post.search(params[:search])
		else
			@posts = Post.all.order("created_at DESC")

		end
	end

	def sample
		@popularposts = Post.all.limit(3).shuffle
		@olderposts = Post.all.order('created_at DESC').limit(6).offset(1)
    	@recentposts = @olderposts.limit(3)
		@lastupdate = News.all.order('created_at DESC').limit(1)
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(6)
	end

	def category
		@men_cat = Category.find(params[:category_id])
	end

	def new
		@contact = Contact.new
	end

end
