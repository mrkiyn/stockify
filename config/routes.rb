Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  #
  get '/products', to: 'products#index', as: :products

  get '/products/new', to: 'products#new' , as: :new_product
  post '/products', to: 'products#create'

  get '/products/:id', to: 'products#show', as: :product

  get '/products/:id/edit', to: 'products#edit', as: :edit_product
  patch '/products/:id', to: 'products#update'

  delete '/products/:id', to: 'products#destroy'
end
