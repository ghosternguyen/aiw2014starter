ActiveAdmin.register Category do
  menu :parent => "Manage Blog"
  controller do
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_user_session_path
      end
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
