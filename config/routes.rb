Rails.application.routes.draw do
  devise_for :users

  resources :toilets, only: [:index, :new, :create]
  root to: 'toilets#index'
end
