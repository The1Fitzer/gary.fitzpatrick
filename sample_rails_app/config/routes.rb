SampleRailsApp::Application.routes.draw do
  resources :line_items

  resources :carts

  get "users/new"

  get "welcome/home"
  get "welcome/thank_you"
  get "welcome/register"

  resources :products
  resources :users
  resources :sessions
  
  root :to => "welcome", :action => "home"
  
  match '/login' => 'sessions#new', :as => "login"
  match '/logout' => 'sessions#destroy', :as => "logout"
  match '/your_cart' => "carts#your_cart", :as => "yout_cart"
end
