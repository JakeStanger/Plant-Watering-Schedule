Rails.application.routes.draw do
  root 'plants#index'

  # Base Plants
  get 'plants' => 'plants#index'
  get 'plants/new' => 'plants#new'
  get 'plants/:id' => 'plants#show', as: :plant
  post 'plants' => 'plants#create'
  get 'plants/:id/edit' => 'plants#edit', as: :edit_plant
  patch 'plants/:id' => 'plants#update'
  delete 'plants/:id' => 'plants#destroy'
  resources :plants

  # Custom user plants
  get 'users/:id' => 'users#show'
  get 'users/:id/new' => 'user_plants#new'
  get 'userplants/:id' => 'user_plants#show', as: :user_plant
  post 'users/:id/' => 'user_plants#create'
  get 'userplants/:id/edit' => 'user_plants#edit', as: :edit_user_plant
  patch 'userplants/:id' => 'user_plants#update'
  delete 'userplants/:id' => 'user_plants#destroy'
  resources :user_plants


  # Signup and login
  get 'signup' => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
