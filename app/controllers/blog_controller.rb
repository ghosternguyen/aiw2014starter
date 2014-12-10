class BlogController < ApplicationController
  def post
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to blog_post_path
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	if @post.destroy
  		redirect_to blog_post_path
  	end
  end

  def post_params
  	params.require(:post).permit(:title, :body, :photo)
  end
  
end
