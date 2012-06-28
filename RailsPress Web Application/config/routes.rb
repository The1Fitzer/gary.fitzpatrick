Webappproject::Application.routes.draw do
  
  match '/preferences/grab' => 'preferences#grab'
  resources :preferences
  resources :users, :user_sessions
  
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  
  
  root :to => 'users#index'
end
