Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'top#index'
  resources :top, only: :index
  resources :users, only: [:index, :show] do
    collection do
      get :setting
      get :nickname
      get :profileimage
      get :profile
      get :gameprofile
      get :email
    end
    member do
      get :followed, :followers, :recommend
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :boards do
    resources :comments, only: [:create, :destroy] 
  end
  resources :posts, only: [:new, :create]
  resources :rooms, only: [:index, :create, :show]
  resources :direct_messages, only: [:create, :destroy]

end
