Oriflame::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope "(:locale)", :locale => /ru|ro/ do
    root 'home#index'
    get "home/index"
    resources :categories
    resources :products
    resources :items
    resources :carts
    resources :orders
  end



end
