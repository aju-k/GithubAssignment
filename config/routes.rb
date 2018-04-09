Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/callbacks" }
  
  root 'githubs#index'
  resources :githubs, only: [:index, :show]
end
