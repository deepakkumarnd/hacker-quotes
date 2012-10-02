StartupQuotes::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login',    to: "devise/sessions#new"
    get 'logout',   to: "devise/sessions#destroy"
  end
  
  
  resources :quotes
  root :to => 'quotes#index'
  devise_scope :quotes do
    get 'random' => 'quotes#random'
  end
end
