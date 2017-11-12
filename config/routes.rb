Rails.application.routes.draw do
  # root 'greeteer#hello'
  devise_for :users
  # resources :users, except: :destroy
  # resources :profiles
  namespace :admin do
    resources :users # , :profiles
  get 'users' => 'admin#users', as: :users
  end
end
