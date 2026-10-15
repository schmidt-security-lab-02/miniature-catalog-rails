Rails.application.routes.draw do
  root "miniatures#index"
  get "up", to: "rails/health#show", as: :rails_health_check
  resources :categories, except: [:show]
  resources :miniatures
end
