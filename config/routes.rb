Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/callbacks" }
  
  root 'githubs#list'
  get '/list', to: 'githubs#list', as: 'list_repos'
  get '/repo/:id', to: 'githubs#details', as: 'detail_info'
  get '/commit-history', to:'githubs#get_commits'

 
end
