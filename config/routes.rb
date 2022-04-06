Rails.application.routes.draw do
  
  root 'ideas#index'
  resources :ideas, except: [:index] do
    resources :likes, shallow: true, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy] 
end