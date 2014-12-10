ActiveAdmin.register Post do
  menu :parent => "Manage Blog"
  controller do
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_user_session_path
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :photo)
    end
  end
end
