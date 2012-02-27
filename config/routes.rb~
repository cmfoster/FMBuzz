FMBuzz::Application.routes.draw do
 
  if Rails.env.production?

    devise_for :shows
    devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 
    
    root :to => 'home#index'
    
    resources :users
    
    resources :shows do
      resources :playlists
      resources :messages
      resources :questions
      get :requests
      get :vote
      get :dashboard
      get :modalplaylist
      get :songlist
    end
    
    resources :song_requests, :only => [:create]
    resources :playlists, :only => [:show]
    match '/city' => 'home#cityindex'
  
  else
    
    root :to => 'home#launch'
    resources :subscribers, :only => [:create]
    match '/contact' => 'subscribers#contact_us'
    
  end
  
end
