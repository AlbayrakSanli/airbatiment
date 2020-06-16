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

  resources :appointments
  resources :charges

<<<<<<< HEAD
  get "teams/test"
  get 'search', to: "houses#search"
=======
  get 'teams/test'
>>>>>>> 139a7c486849aecb305a394a19b4123c7bdf2a0e
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
