Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: %i[index show new create update]
  resources :listings, only: %i[index show new create] #skills

end
