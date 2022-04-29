Rails.application.routes.draw do
  resources :details
  resources :order_details
  resources :orders
  resources :cashiers
  resources :managers
  root 'welcome#index'
end
