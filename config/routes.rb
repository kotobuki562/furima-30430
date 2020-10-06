Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new,:create,:show,:edit,:update,:destroy]
  get '/purchases/:id', to: 'purchases#index'
  post '/purchases/:id', to: 'purchases#create'
end
