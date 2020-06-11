Rails.application.routes.draw do
  devise_for :owners, path: 'owners'
  devise_for :users, path: 'users'
  resources :houses
  root "houses#index"
  resources :teams, only: :index
  resources :users
  resources :owners
  resources :appointments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
