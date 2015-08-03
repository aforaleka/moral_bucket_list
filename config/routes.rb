Rails.application.routes.draw do
  
 
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'welcome#index'
  get '/dash', to: 'welcome#dash'
  get '/profile', to: 'users#profile'

  
  resources :users do
  	resources :virtues 
  end
  
  resources :items
  
end
