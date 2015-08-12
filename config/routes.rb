Rails.application.routes.draw do
  root "lists#index"
  resources :lists do
    resources :tasks
  end

  resources :tags, only: [:show]

  #Add Tag
  get 'add-tag/:id/:name', to: 'tags#create', as: 'new_tag'


  #AJAX filters
  get '/filter/title/:id', to: 'filters#title', as: 'filter_title'
  get '/filter/status/:id', to: 'filters#status', as: 'filter_status'
  get '/filter/due-date/:id', to: 'filters#due_date', as: 'filter_due_date'
  get '/filter/search/:id/:term', to: 'filters#search', as: 'filter_search'
  get '/filter/search-reset/:id', to: 'filters#search_reset', as: 'filter_search_reset'
  get '/filter/search-tags/:id', to: 'filters#search_tags', as: 'filter_search_tags'

  #AJAX status updaters
  get '/status/complete/:id', to: 'statuses#complete', as: 'status_complete'
  get '/status/incomplete/:id', to: 'statuses#incomplete', as: 'status_incomplete'
end
