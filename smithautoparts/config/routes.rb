Smithautoparts::Application.routes.draw do
  resources :products
  resource :assets

  root :to => 'products#index'
end
