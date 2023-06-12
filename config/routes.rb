Rails.application.routes.draw do
  root 'contacts#index'

  resources :contacts
  get '/payments', to: 'payments#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
