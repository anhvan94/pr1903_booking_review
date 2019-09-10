# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books
  resources :likes
  resources :requests
  resources :favorites
  resources :book_statuses
  resources :activities
  resources :relationships
  resources :categories
  resources :reviews
end

