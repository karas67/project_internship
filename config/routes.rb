Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  devise_for :managers
  resources :details
  resources :order_details
  resources :orders
  resources :cashiers
  resources :managers
  root 'welcome#index'
end
