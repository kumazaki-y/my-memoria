require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resource :like, only: [:create, :destroy]
    resources :comments, only: [:index,:show, :create, :destroy]
  end
  
  resource :profile, only: [:show, :edit, :update]
  
  resources :accounts, only: [:show] do
    resources :follows, only:[:create]
    resources :unfollows, only:[:create]
    resources :followers, only: [:index]
    resources :followings, only: [:index]
  end

  resources :search, only: [:index]

end
