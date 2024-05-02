Rails.application.routes.draw do
  get 'home', to: 'home#show', as: 'home'
  get 'welcome/:first_name', to: 'welcome#show', as: 'welcome'
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'

  
  resources :sessions, only: [:create, :new]
  delete 'sessions', to: 'sessions#destroy', as: 'logout'
  resources :city
  resources :users
  resources :gossips do
    resources :comments
  end
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "welcome#show"
end