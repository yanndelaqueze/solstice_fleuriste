Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get 'creations', to: 'shop#index'
  get '/panier', to: 'cart#show'
  get '/admin', to: 'pages#admin'
  get '/compte', to: 'pages#account'
  get '/livraison', to: 'pages#delivery'
  get '/commandes', to: 'pages#my_orders'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :categories

  resources :products, only: %i[new create]

  resources :products do
    resources :order_items, only: %i[create]
  end

  resources :orders do
    member do
      patch 'validate', to: "orders#validate"
    end
    resources :payments, only: :new
  end

  resources :order_items, only: %i[update destroy]

  resources :polygons, only: %i[index new create show]

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
