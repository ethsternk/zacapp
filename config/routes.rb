Rails.application.routes.draw do
  root 'contacts#index'

  get '/contacts', to: 'contacts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
