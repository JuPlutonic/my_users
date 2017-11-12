Rails.application.routes.draw do
  resources :users, except: :destroy
  namespace :users do
    resources :profiles
  end
  devise_for :users
  get 'hello' => 'greeter#hello', as: :hello
  get 'goodbye' => 'greeter#goodbye', as: :goodbye
  root 'greeter#hello'
end
