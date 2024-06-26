# frozen_string_literal: true

Rails.application.routes.draw do
  get 'conversations/index'
  resources :posts
  devise_for :users
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post 'toggle_like', to: 'likes#toggle_like', as: :toggle_like

  resources :comments, only: %i[create destroy]
  resources :users, only: %i[show index]

  post 'follow', to: 'follows#follow', as: :follow
  delete 'unfollow', to: 'follows#unfollow', as: :unfollow
  delete 'cancel_request', to: 'follows#cancel_request', as: :cancel_request

  post 'accept_follow', to: 'follows#accept_follow', as: :accept_follow
  delete 'decline_follow', to: 'follows#decline_follow', as: :decline_follow
  resources :conversations, only: %i[index show]
  resources :user_conversations, only: %i[create destroy]
  resources :messages
end
