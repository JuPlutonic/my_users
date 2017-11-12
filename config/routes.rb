# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # resources :users, except: :destroy
  namespace :users do
    resources :profiles
  end
  get 'hello' => 'greeter#hello', as: :hello
  get 'goodbye' => 'greeter#goodbye', as: :goodbye
  root 'greeter#hello'
end
