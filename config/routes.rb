Rails.application.routes.draw do
  resources :log_workouts
  resources :workouts
  resources :logs
  resources :users

  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'

  root 'sessions#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
