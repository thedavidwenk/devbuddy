Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index] do
    member do
      get 'profile', to: 'users#show'
    end
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :feedbacks, only: [:new, :create]
  end
end
