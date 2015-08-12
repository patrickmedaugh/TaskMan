Rails.application.routes.draw do
  root "lists#index"
  resources :lists do
    resources :tasks
  end

  resources :tags, only: [:show]

  #Add Tag
  get 'add-tag/:id/:name', to: 'tags#create', as: 'new_tag'

  #AJAX sorts
  get '/sort/title/:id', to: 'sorts#title', as: 'sort_title'
  get '/sort/status/:id', to: 'sorts#status', as: 'sort_start_date'
  get '/sort/due-date/:id', to: 'sorts#due_date', as: 'sort_due_date'

  #AJAX filters
  get '/filter/status/:id/:status', to: 'filters#status', as: 'filter_status'
  get '/filter/due-date/:id/:due_date', to: 'filters#due_date', as: 'filter_due_date'
  get '/filter/search/:id/:term', to: 'filters#search', as: 'filter_search'
  get '/filter/search-reset/:id', to: 'filters#search_reset', as: 'filter_search_reset'
  get '/filter/search-tags/:id', to: 'filters#search_tags', as: 'filter_search_tags'
  get '/filter/tags/:name', to: 'filters#tags', as: 'filter_tags'
  get '/filter/start-date/:id/:start_date', to: 'filters#start_date', as: 'filter_start_date'


  #AJAX status updaters
  get '/status/complete/:id', to: 'statuses#complete', as: 'status_complete'
  get '/status/incomplete/:id', to: 'statuses#incomplete', as: 'status_incomplete'
end
