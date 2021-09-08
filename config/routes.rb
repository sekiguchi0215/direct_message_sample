Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  devise_for :users
  root "posts#index"
  resources :posts
  resources :users, only: [:index, :show]
  resources :messages, only: [:create]
  resources :rooms, only: [:index, :create, :show]
  resources :groups
  resources :group_messages, only: [:create]
end
