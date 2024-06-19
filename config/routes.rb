Rails.application.routes.draw do
  root to: "users#home"

  devise_for :users

  resources :users, only: [:index, :home] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :feedbacks, only: [:new, :create]
  end
end
