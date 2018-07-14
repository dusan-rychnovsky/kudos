Rails.application.routes.draw do

  devise_for :users
  root "kudos#index"
  resources :kudos
  resources :users, only: [:show]

  namespace :admin do
    resources :users
  end
end
