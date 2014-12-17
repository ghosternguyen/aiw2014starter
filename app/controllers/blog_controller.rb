class BlogController < ApplicationController
  def index
  end

  def post
    @categories = Category.all
    @posts = Post.all
    @posts = Post.includes(:category)
    @popularposts = Post.all.order('created_at DESC').limit(3)
    @recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
  end

  def post_detail
    @categories = Category.all
    @post_detail = Post.find(params[:id])
    @posts = Post.includes(:category)
    @popularposts = Post.all.order('created_at DESC').limit(3)
    @recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
  end

  def category
    @categories = Category.all
    @popularposts = Post.all.order('created_at DESC').limit(3)
    @recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
  end
end
