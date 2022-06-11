Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'decline', to: 'bookings#decline_booking', as: :decline
  get 'accept', to: 'bookings#accept_booking', as: :accept
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :garages do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index edit update destroy]
end
