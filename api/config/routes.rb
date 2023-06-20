
Rails.application.routes.draw do
  root 'api/v1/welcomes#index'

  namespace :api do
    namespace :v1 do
      resources :welcomes
      resources :users, only: [:create, :index]
      post '/login', to: 'auth#create'
      delete '/logout', to: 'auth#destroy'
      get '/profile', to: 'users#profile'
      match '/users', to: 'users#options', via: [:options]
    end
  end
end
