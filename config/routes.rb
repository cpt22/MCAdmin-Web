Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'home#index'

  resources :users, only: [:new, :create]

  resources :servers, only: [:index, :show]

  resources :account, only: :index

  resources :home, only: :index

  resources :install, only: :index
end
