Rails.application.routes.draw do

  root 'home_page#home'
  get '/home', to: 'home_page#home'

  get '/about', to: 'home_page#about'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/forum', to:'home_page#forum'
  get '/course_eval', to:'home_page#course_eval'
  get '/suggestion', to:'home_page#suggestion'

  get '/course_eval/givefeedback', to:'course_eval#give_feedback'
  get '/course_eval/getfeedback', to:'course_eval#get_feedback'
  post  '/course_eval/givefeedback', to:'course_eval#get_feedback_form'
  get  '/course_eval/givefeedback/id', to:'course_eval#show_feedback_form'




  resources :users
end