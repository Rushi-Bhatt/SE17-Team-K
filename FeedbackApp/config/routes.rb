Rails.application.routes.draw do
  root 'home_page#home'
  get '/home', to: 'home_page#home'

  get '/about', to: 'home_page#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'users#login'
end