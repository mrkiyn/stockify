Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  

  get '/', to: 'products#index', as: :products 

  get '/new', to: 'products#new' , as: :new_product
  post '/', to: 'products#create'

  get '/:id', to: 'products#show', as: :product

  get '/:id/edit', to: 'products#edit', as: :edit_product
  patch '/:id', to: 'products#update'

  delete '/:id', to: 'products#destroy'
end
