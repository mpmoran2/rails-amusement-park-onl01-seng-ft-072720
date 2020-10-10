Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :attractions
  resources :rides
  resources :sessions

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'  
  get '/signup', to: 'users#new'

  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/show'
  get 'attractions/index'
  get 'attractions/destroy'

  root to: 'application#home' 
  #get '/users', to:'users#index', as: 'users'
  #post '/users', to:'users#create'
  #get '/users/:id', to: 'users#show', as: 'user'
  #get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  #get '/attractions', to: 'attractions#index', as: 'attractions'
  #get '/signin', to: 'session#new', as: 'signin'
  #post '/session', to: 'session#create', as: 'session'
  #delete '/session/', to: 'session#destroy'
  #get '/attractions/new', to: 'attractions#new', as: 'new_attraction'
  #get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  #get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  #patch '/attractions/:id', to: 'attractions#update'
  #post '/attractions', to: 'attractions#create'
  #post '/rides', to:"rides#create", as: 'rides'
end
