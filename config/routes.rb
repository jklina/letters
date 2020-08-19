Rails.application.routes.draw do
  resources :letters
  get 'home/index'
  root to: "home#index", as: :root
end
