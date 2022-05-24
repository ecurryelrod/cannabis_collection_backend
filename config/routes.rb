Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/get_current_user', to: 'sessions#get_current_user'
  delete '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :effects
      resources :strains
      resources :types
      resources :users
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
