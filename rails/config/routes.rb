Rails.application.routes.draw do
  root "kudos#index"
  resources :kudos
end
