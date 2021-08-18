Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :bookings, only: [ :new, :create]
    # resources :trips, only: [:trip_id]
  end
  resources :bookings, only: [:show, :index, :destroy]
end
