# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :profiles

  namespace :admin do
    resources :users , except: :show
  end
  resources :users , only: :show

  get 'hello' => 'greeter#hello', as: :hello
  get 'goodbye' => 'greeter#goodbye', as: :goodbye
  root 'greeter#hello'
end
