Rails.application.routes.draw do
  root "static_pages#index"
  # Classrooms
  get 'classrooms/index', to: "classrooms#index", as: "classrooms_index"
  get 'classrooms/show/:id', to: "classrooms#show", as: "classroom_show"
  post 'classrom/create', to: "classrooms#create", as: "classroom_create"
  delete 'classroom/delete:id', to: "classrooms#delete", as: "classroom_delete"
  #Products
  get 'products/index', to: 'products#index', as: "products_index"
  get 'products/show', to: 'products#show', as: "product_show"
  post 'products/create', to: 'products#create', as: "product_create"
  post 'products/edit/:id', to: "products#update", as: "product_update"
  delete 'products/delete/:id', to: "products#delete", as: "product_delete"
  # Courses
  get 'courses/index'
  get 'courses/new'
  get 'courses/show/:id', to: "courses#show", as: "course_show"
  #get "course/:id/classlist", to: "courses#classlist", format: "pdf", as: "classlist"
  post 'courses/create', to: "courses#create", as: "course_create"
  delete 'course/delete/:id', to: "courses#destroy", as: "course_delete"
  #Shelves
  get 'shelves/show/:id', to: "shelves#show", as: "shelf_show"
  # Students
  get 'students/index', to: "students#index", as: "students_index"
  get 'students/show/:id', to: "students#show", as: "student_profile"
  get 'students/new', to: "students#new", as: "student_new"
  post 'students/create'
  post 'students/create_multiple', to: 'students#create_multiple', as: "students_multiple"
  post 'students/update'
  delete 'students/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Workers
  get "signup", to: "workers#new", as: "new_worker"
  post "signup", to: "workers#create"
  get "worker/:id", to: "workers#show", as: "worker_profile"
  get "workers/all", to: "workers#index", as: "workers_index"
  post "workers/edit/:id", to: "workers#edit", as: "worker_edit"
  delete "workers/delete/:id", to: "workers#delete", as: "worker_delete"
  # Sessions
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :workers, except: [:new]
  #Warehoouses
  get 'warehouses/index', to: "warehouses#index", as: "warehouses_index"
  get 'warehouses/show/:id', to: 'warehouses#show', as: "warehouse_show"
end
