Rails.application.routes.draw do
  get 'comments/create'

  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :edit, :update]
    collection do
      get 'popular'
      get 'newest'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
