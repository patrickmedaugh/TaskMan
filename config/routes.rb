Rails.application.routes.draw do
  root "lists#index"
  resources :lists do
    resources :tasks
  end

  #AJAX filters
  get '/filter/title/:id', to: 'filters#title'
  get '/filter/status/:id', to: 'filters#status'
  get '/filter/due-date/:id', to: 'filters#due_date'
end
