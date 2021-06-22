Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'home#index'
  # unauthenticated :user do
  #   root to: 'home#index', as: :unauthenticated_root
  # end
  #
  # authenticated :user do
  #   root to: 'servers#index', as: :authenticated_root
  # end

  resources :users, only: [:new, :create]

  resources :servers, only: :index

  resources :home, only: :index
end
