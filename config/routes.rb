Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    collection do 
      get 'popular'
      get 'newest'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
