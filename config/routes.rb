Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  root to: "pages#home"
  get 'creations', to: 'shop#index'
  get '/panier', to: 'cart#show'
  get '/admin', to: 'pages#admin'
  get '/compte', to: 'pages#account'
  get '/livraison', to: 'pages#delivery'
  get '/mes_commandes', to: 'pages#my_orders'
  get '/zone_de_livraison', to: 'polygons#new'
  get '/commandes', to: 'orders#index'
  get '/catalogue', to: 'categories#index'
  get '/contact', to: 'contacts#new'
  get '/conditions_generales_de_vente', to: 'pages#cgv'
  get '/mentions_legales', to: 'pages#mentions_legales'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :categories

  resources :contacts

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

  resources :shop_statuses, only: %i[new create edit update]

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
