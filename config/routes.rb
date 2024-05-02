Rails.application.routes.draw do
  resources :likes, only: [:index, :create, :destroy]
  get 'home', to: 'home#show', as: 'home'
  get 'welcome/:first_name', to: 'welcome#show', as: 'welcome'
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'

  
  resources :sessions, only: [:create, :new, :destroy]

  resources :gossips do
    resources :comments
    member do
      post 'like', to: 'gossips#like', as: 'like_post'
      delete 'unlike', to: 'gossips#unlike', as: 'unlike'
    end
  end
  
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