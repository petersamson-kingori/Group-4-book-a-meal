
Rails.application.routes.draw do
  root 'api/v1/welcomes#index'

  namespace :api do
    namespace :v1 do
    
      resources :welcomes
      resources :users, only: [:create, :index, :show]
      post '/login', to: 'auth#create'
      delete '/logout', to: 'auth#destroy'
      get '/profile', to: 'users#profile'
      #get '/current_user', to: 'users#current_user'
    end
  end
end