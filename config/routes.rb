Rails.application.routes.draw do
  resources :log_workouts
  resources :workouts
  resources :logs
  resources :users

  resources :users, only: [:show] do
    resources :logs, only: [:show, :index]
  end

  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'sessions#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
