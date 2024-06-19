Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :feedbacks, only: [:new, :create]
  end
end
