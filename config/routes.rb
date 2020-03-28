# frozen_string_literal: true

Rails.application.routes.draw do

  resources :locations
  resources :characters
  resources :episodes

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end