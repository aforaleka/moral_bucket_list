Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'
  get '/dash', to: 'welcome#dash'
  
end
