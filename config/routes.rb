Rails.application.routes.draw do

  devise_for :owners, path: 'owners'
  devise_for :users, path: 'users'

  resources :houses
  resources :houses, only: [:show] do
    resources :apictures, only: [:create]
    resources :bpictures, only: [:create]
    resources :cpictures, only: [:create]
    resources :dpictures, only: [:create]
    resources :epictures, only: [:create]
    resources :fpictures, only: [:create]
    resources :gpictures, only: [:create]
  end

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

  get "teams/test"
  get 'search', to: "houses#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
