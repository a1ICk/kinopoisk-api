# frozen_string_literal: true

Rails.application.routes.draw do
  resources :movies, param: :param
  resources :actors
  resources :producers
  resources :ratings
end
