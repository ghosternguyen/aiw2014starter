Rails.application.routes.draw do
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  root 'home#index'

  get 'home/index'
  get 'home/sample'

  get 'blog/post'
  post 'blog', to: 'blog#create', as: "blog_create_path"
  post 'blog', to: 'blog#create', as: 'blog_create'
  delete 'blog/:id', to: 'blog#destroy', as: 'blog_destroy'

  get 'admin/custom'
  get 'admin/assets'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users  
end
