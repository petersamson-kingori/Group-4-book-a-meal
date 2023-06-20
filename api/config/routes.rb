
Rails.application.routes.draw do
 
  namespace :api do
    namespace :v1 do
      root 'welcomes#index'
      resources :welcomes
      resources :users, only: [:create, :index]
      post '/login', to: 'auth#create'
      delete '/logout', to: 'auth#destroy'
      get '/profile', to: 'users#profile'
    end
  end
end