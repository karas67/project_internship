Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :details
  resources :order_details
  resources :orders
  resources :cashiers
  resources :managers
  root 'welcome#index'
end
