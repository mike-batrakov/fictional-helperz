Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, only: :create
  end

  resources :bookings, only: [ :show, :destroy]

  patch 'bookings/:id', to: 'bookings#accept'
  delete 'bookings/:id', to: 'bookings#decline'
end
