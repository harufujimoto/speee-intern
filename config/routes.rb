# frozen_string_literal: true

Rails.application.routes.draw do
  resources :thanks, only: :index
  resources :stores, only: :show
  resources :evaluation_requests, only: %i[new create]
  resources :reviews, only: :show
  resources :prefectures, only: %i[index show]
  resources :cities, only: :show

  # Defines the root path route ("/")
  root 'prefectures#index'
end
