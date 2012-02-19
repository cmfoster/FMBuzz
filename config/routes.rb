FMBuzz::Application.routes.draw do
 
  devise_for :shows
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    root :to => 'home#launch' #   Set this to root again when ready to launch
  end
  resources :subscribers, :only => [:create]

  if Rails.env.development?

  #   root :to => 'home#index'
  
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
  
  end
end
