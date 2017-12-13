Rails.application.routes.draw do
  namespace :api do
    resources :locations
  end
  root :to => 'home#index'
  devise_for :users
  resources :home, :only => :index
  resources :locations

end
