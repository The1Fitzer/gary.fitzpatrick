Smithautoparts::Application.routes.draw do
  get "welcome/home"

  resources :products
  resource :assets

  root :to => 'welcome#home'
end
