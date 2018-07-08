Rails.application.routes.draw do
  devise_for :users
  root "kudos#index"
  resources :kudos
end
