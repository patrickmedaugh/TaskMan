Rails.application.routes.draw do
  root "lists#index"
  resources :list
end
