Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'

  get 'home/index'
  get 'home/news'
  get 'home/news_detail'
  get 'home/search'

  

  get 'blog/post'
  get 'blog/post_detail'
  get 'blog/category'

  namespace :admin do
    resources :users
    resources :posts
    resources :news
  end

  get 'contacts/new'
  post 'contacts', to: 'contacts#create', as: 'contacts_create'


  get 'home/sample'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

end
