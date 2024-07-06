Rails.application.routes.draw do
  get 'notifications/index'
  get 'notifications/mark_as_read'
  root to: "users#home"
  get 'time_slots/new'
  get 'time_slots/create'
  get 'time_slots/edit'
  get 'time_slots/delete'

  devise_for :users

  # Custom route for getstarted
  get 'getstarted', to: 'users#getstarted'

  resources :users, only: [:index, :home] do

    member do
      get 'profile', to: 'users#show'
      get 'account_overview', to: 'users#account_overview'
      # favorite feature
      post 'toggle_favorite', to: "users#toggle_favorite"
    end
    resources :bookings, only: [:create, :destroy]
  end

  resources :bookings, only: [:index, :edit, :update] do
    resources :feedbacks, only: [:new, :create]
    # accept and reject a booking
    member do
      patch :accept
      patch :reject
    end
  end

  resources :time_slots, only: [:new, :create, :edit, :update, :destroy]

  # Other routes...
  resources :notifications, only: [] do
    member do
      patch :mark_as_read
    end
  end
end
