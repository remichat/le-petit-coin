Rails.application.routes.draw do
  devise_for :users

  resources :toilets, only: [:index, :new, :create, :update, :edit, :show]
  root to: 'toilets#index'
end
