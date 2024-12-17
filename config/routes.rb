# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories, except: %i[show]
  resources :order_payments
  resources :order_items
  resources :orders
  resources :products
  resources :suppliers
  resources :clients
  resources :transactions
  resources :accounts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: 'home#index'
end
