Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home' => 'users#home'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#socialcreate'
  post '/enrollments/new' => 'enrollments#create', as: 'enrollments'
  delete '/enrollments/:id/unenroll' => 'enrollments#destroy', as: 'unenroll'

  resources :courses 	
  
  resources :teachers do
  	resources :courses, only: [:show, :index, :new] 
  end
end
