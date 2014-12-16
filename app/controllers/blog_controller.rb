class BlogController < ApplicationController
  def index
    @posts = Post.all
  end

  def post
    @posts = Post.all
  end

  def post_detail
    @post_detail = Post.find(params[:id])
  end
end
