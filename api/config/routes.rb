
Rails.application.routes.draw do

  root 'api/v1/welcomes#index'

  namespace :api do
    namespace :v1 do
    
      resources :welcomes
      resources :menus  
      
      resources :caterers, only: [:create, :index, :show]
      resources :users, only: [:create, :index, :show]

      post '/login', to: 'auth#create'
      post '/login_caterer', to: 'auth#create_caterer'

      delete '/logout', to: 'auth#destroy'
      delete '/logout_caterer', to: 'auth#destroy_caterer'
      get '/profile', to: 'users#profile'
      get '/profile_caterer', to: 'caterers#profile'
      #get '/current_user', to: 'users#current_user'
    end
  end
end