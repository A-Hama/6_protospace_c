Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  get 'prototypes/popular'
  get 'prototypes/newest'
  resources :prototypes
  resources :users, only: [:show, :edit, :update]
end
