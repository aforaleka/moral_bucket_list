Rails.application.routes.draw do
  
 
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'welcome#index'
  get '/dash', to: 'welcome#dash'
  get '/friends', to: 'events#friends'
  get '/public', to: 'events#public'


  resources :users do
  	member do 
  		get 'to_do'
      get 'follow'
      get 'unfollow'
  	end
  end

  resources :acts do
  	member do 
  		get 'add_to_do'
  		get 'add_to_done'
  	end
  end
  

end
