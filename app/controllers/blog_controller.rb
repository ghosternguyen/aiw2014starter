class BlogController < ApplicationController
  def index
  end

  def post
    @men_cat = Category.all
    @bar_cat = @men_cat.limit(6)
    @posts = Post.all.page(params[:page]).per(5)
    @popularposts = Post.all.limit(3).shuffle
    @olderposts = Post.all.order('created_at DESC').limit(6).offset(1)
    @recentposts = @olderposts.limit(3)
  end

  def post_detail
    @men_cat = Category.all
    @bar_cat = @men_cat.limit(6)
    @post_detail = Post.find(params[:id])
    @posts = Post.includes(:category)
    @popularposts = Post.all.limit(3).shuffle
    @olderposts = Post.all.order('created_at DESC').limit(6).offset(1)
    @recentposts = @olderposts.limit(3)
    @category = Category.find(@post_detail.category_id)
    @relatedposts = @category.post.limit(5)
  end

  def category
    @men_cat = Category.all
    @bar_cat = Category.all.limit(6)
    @category = Category.find(params[:category_id])
    @posts = @category.post.order('created_at DESC')
    @firstpost = @posts.limit(1)
    @under1stpost = Kaminari.paginate_array(@posts.offset(1)).page(params[:page]).per(5)
    @popularposts = Post.all.limit(3).shuffle
    @olderposts = Post.all.order('created_at DESC').limit(6).offset(1)
    @recentposts = @olderposts.limit(3)
  end

end
