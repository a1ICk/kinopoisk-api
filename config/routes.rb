# frozen_string_literal: true

Rails.application.routes.draw do
  resources :movies, only: %i[index show]
  resources :actors
  resources :producers
  resources :ratings
  resources :users
  post 'auth/login', to: 'authentication#login'
end
