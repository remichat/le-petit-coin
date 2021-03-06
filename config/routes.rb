Rails.application.routes.draw do
  devise_for :users

  resources :toilets, only: [:index, :new, :create, :update, :edit, :show] do
    resources :bookings, only: [:new, :create,]
  end

  resources :bookings, only: [:index, :destroy]

  patch '/bookings/:id/accept', to: "bookings#accept", as: "accept_booking"
  patch '/bookings/:id/reject', to: "bookings#reject", as: "reject_booking"
  get '/bookings/:user_id/number_of_notifications', to: "bookings#number_of_notifications_for_user", as:"number_of_notifs"

  namespace :owner do
    resources :bookings, only: :index
  end

  root to: 'pages#home'
end
