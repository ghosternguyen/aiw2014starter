class BlogController < ApplicationController
  def index
  end

  def post
    @men_cat = Category.all
    @bar_cat = @men_cat.limit(5)
    @posts = Post.all
    @posts = Post.includes(:category)
    @popularposts = Post.all.order('created_at DESC').limit(3)
    @recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
  end

  def post_detail
    @men_cat = Category.all
    @bar_cat = @men_cat.limit(5)
    @post_detail = Post.find(params[:id])
    @posts = Post.includes(:category)
    @popularposts = Post.all.order('created_at DESC').limit(3)
    @recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
    @category = Category.find(@post_detail.category_id)
    @relatedposts = @category.post.limit(5)
  end

  def category
    @men_cat = Category.all
    @bar_cat = Category.all.limit(5)
    @category = Category.find(params[:category_id])
    @posts = @category.post.limit(5)
    @firstpost = @category.post.limit(1)
    @under1stpost = @posts.offset(1)
    @popularposts = Post.all.order('created_at DESC').limit(3)
    @recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
  end

end
