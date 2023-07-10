
Rails.application.routes.draw do

  resources :reviews
 
 
  root 'api/v1/welcomes#index'

  namespace :api do
    namespace :v1 do
    
      resources :welcomes
      resources :menus, only: [:create, :index, :show] 

      resources :orders
     

      
      resources :caterers do
        resources :menus do
          resources :menu_options
        end
      end

      resources :users, only: [:create, :index, :show] do
        resources :user_menu_options, only: [:index]
      end

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