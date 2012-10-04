StartupQuotes::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :quotes
  root :to => 'quotes#index'
  devise_scope :quotes do
    get 'random' => 'quotes#random'
  end
end
