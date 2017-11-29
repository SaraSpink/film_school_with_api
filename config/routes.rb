Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  resources :home, :only => :index
  resources :locations

end
