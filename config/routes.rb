Rails.application.routes.draw do
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
      # post 'favorite', to: 'favorites#create'
      # delete 'unfavorite', to: 'favorites#destroy'
    end
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :feedbacks, only: [:new, :create]
  end
end
