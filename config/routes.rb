Rails.application.routes.draw do
  devise_for :users

  resources :toilets, only: [:index, :new, :create, :update, :edit, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: :index

  root to: 'toilets#index'
end
