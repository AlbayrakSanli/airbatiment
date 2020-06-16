Rails.application.routes.draw do

  devise_for :owners, path: 'owners'
  devise_for :users, path: 'users'
  resources :houses
  root 'pages#index'
  resources :teams, only: :index

  resources :users
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :owners
  resources :owners, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :availabilities
  resources :appointments
  resources :charges

  get 'teams/test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
