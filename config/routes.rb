Rails.application.routes.draw do
 root 'home#index'

  get 'home/index'
  get 'home/news'
  get 'home/news_detail'
  get 'home/search'

  

  get 'blog/post'
  get 'blog/post_detail'
  get 'blog/category'

  post 'blog', to: 'blog#create', as: "blog_create_path"
  post 'blog', to: 'blog#create', as: 'blog_create'
  delete 'blog/:id', to: 'blog#destroy', as: 'blog_destroy'

  get 'contacts/new'
  post 'contacts', to: 'contacts#create', as: 'contacts_create'



  get 'home/sample'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users  
end
