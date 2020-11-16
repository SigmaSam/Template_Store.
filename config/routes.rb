Rails.application.routes.draw do
  resources :users, only: %i[create show]
  resources :items
  resources :categories
  resources :comments, only: [:create]
  
  get "/sign_up", to: "users#new"
  get "/log_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"

  root "items#index"
end
