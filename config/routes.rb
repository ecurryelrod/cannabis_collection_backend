Rails.application.routes.draw do
  resources :types
  resources :effects
  resources :strains
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
