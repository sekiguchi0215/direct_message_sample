Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts
  resources :users, only: [:index, :show]
  resources :messages, only: [:create, :update]
  resources :rooms, only: [:index, :create, :show]
  resources :groups
  resources :group_messages, only: [:create, :update]
  resources :notifications, only: [:index]
end
