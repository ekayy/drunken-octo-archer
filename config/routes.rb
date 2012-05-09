Project01::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :create]

  root :to => "users#new"

  match '/signup',  to: 'users#new'
  
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/create', to: 'profiles#new'
  

end