# frozen_string_literal: true

Rails.application.routes.draw do
  resources :thanks, only: :index
  resources :stores, only: :show

  # Defines the root path route ("/")
  # root "articles#index"
end
