FMBuzz::Application.routes.draw do
 
  devise_for :shows
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    root :to => 'home#index'
  end

  root :to => 'home#index'
  
  resources :users
  
  resources :shows do 
    resources :messages
    get :vote
    get :dashboard
  end
  
  match '/city' => 'home#cityindex'
  
end
