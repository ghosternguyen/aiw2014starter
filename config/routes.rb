Rails.application.routes.draw do
  get 'blog/post'

  root 'home#index'

  get 'home/index'
  get 'home/sample'

  get 'admin/custom'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  post 'blog', to: 'blog#create', as: "blog_create_path"

  post 'blog', to: 'blog#create', as: 'blog_create'

  delete 'blog/:id', to: 'blog#destroy', as: 'blog_destroy'
  
end
