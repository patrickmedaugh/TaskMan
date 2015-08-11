Rails.application.routes.draw do
  root "lists#index"
  resources :lists do
    resources :tasks
  end

  #AJAX filters
  get '/filter/title/:id', to: 'filters#title', as: 'filter_title'
  get '/filter/status/:id', to: 'filters#status', as: 'filter_status'
  get '/filter/due-date/:id', to: 'filters#due_date', as: 'filter_due_date'

  #AJAX status updaters
  get '/status/complete/:id', to: 'statuses#complete', as: 'status_complete'
  get '/status/incomplete/:id', to: 'statuses#incomplete', as: 'status_incomplete'
end
