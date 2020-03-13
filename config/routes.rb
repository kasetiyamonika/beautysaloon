Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get '/index', to: 'home#index'

  get '/search', to: 'home#search'

  resources :products

  resources :services, only: [:index, :show]

  resources :orders

  resources :carts, only: [:index, :show]

  resources :appointments

  resources :order_products

  resources :abouts

  resources :blogs

  resources :contactus

  root to: 'home#index'
end
