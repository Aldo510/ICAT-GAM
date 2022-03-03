Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#index"
  get "/signup", to: "workers#new", as: "new_worker"
  post "/signup", to: "workers#create"
  get "/worker/:id", to: "workers#show", as: "worker_profile"
  get "/workers/all", to: "workers#index", as: "workers_index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :workers, except: [:new]
end
