Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'
  get 'home/news'
  get 'home/contact'
  

  get 'blog/post'
  post 'blog', to: 'blog#create', as: "blog_create_path"
  post 'blog', to: 'blog#create', as: 'blog_create'
  delete 'blog/:id', to: 'blog#destroy', as: 'blog_destroy'



  get 'home/sample'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users  
end
