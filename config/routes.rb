Rails.application.routes.draw do
  root to: "users#home"

  devise_for :users

  resources :users, only: [:index, :home] do
    member do
      get 'profile', to: 'users#show'
      get 'account_overview', to: 'users#account_overview'
    end
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :feedbacks, only: [:new, :create]
  end
end
