Rails.application.routes.draw do
  devise_for :users
  resources :letters
  get 'home/index'
  root to: "home#index", as: :root
  namespace :admin do
    resources :letters
  end
end
