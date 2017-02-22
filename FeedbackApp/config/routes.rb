Rails.application.routes.draw do
  get 'sessions/new'

  root 'home_page#home'
  get '/home', to: 'home_page#home'

  get '/about', to: 'home_page#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
end