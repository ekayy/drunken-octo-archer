Project01::Application.routes.draw do

  resources :users do
    resources :profiles
  end

  resources :sessions, only: [:new, :create, :destroy]
  
  root :to => 'sessions#new'

  match '/signup',  to: 'users#new'
  
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  

end