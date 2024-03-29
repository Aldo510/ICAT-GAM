Rails.application.routes.draw do
  root "static_pages#index"
  # Academies
  get 'academies/index', to: 'academies#index', as: "academies_index"
  get 'academies/show/:id', to: 'academies#show', as: "academy_show"
  # Certifieds
  get 'certifieds/index', to: "certifieds#index", as: "certifieds_index"
  get 'certifieds/show/:course_id', to: "certifiedes#show", as: "certified_show"
  # Classrooms
  get 'classrooms/index', to: "classrooms#index", as: "classrooms_index"
  get 'classrooms/show/:id', to: "classrooms#show", as: "classroom_show"
  post 'classroom/create', to: "classrooms#create", as: "classroom_create"
  post "classroom/update/:id", to: "classrooms#update", as: "classroom_update"
  delete 'classroom/delete:id', to: "classrooms#delete", as: "classroom_delete"
  #DataSheets
  get 'data_sheet/all', to: 'data_sheets#index', as: "data_sheets_index"
  get 'data_sheets/show/:id', to: "data_sheets#show", as: "data_sheet_show"
  post 'data_sheets/create', to: "data_sheets#create", as: "data_sheet_create"
  delete 'data_sheets/delete/:data_sheet_id', to: 'data_sheets#delete', as: "data_sheet_delete"
  # SupplyDataSheet
  delete 'supply_data_sheet/delete_control/:id', to: 'supply_data_sheets#delete_control', as: "delete_supply_data_sheet_control"
  #Products
  get 'products/index', to: 'products#index', as: "products_index"
  get 'products/show/:id', to: 'products#show', as: "product_show"
  get 'products/download_file', to: 'products#download_csv', as: "products_csv"
  post 'products/create', to: 'products#create', as: "product_create"
  post 'products/edit/:id', to: "products#update", as: "product_update"
  post 'products/create_multiple', to: "products#create_multiple", as: "products_multiple"
  delete 'products/delete/:id', to: "products#delete", as: "product_delete"
  # Courses
  get 'courses/index'
  get ' courses/index_external', to: 'courses#index_external', as: "courses_external"
  get 'courses/new'
  get 'courses/download_file', to: 'courses#download_csv', as: 'courses_csv'
  get 'courses/show/:id', to: "courses#show", as: "course_show"
  get 'courses/show_control/:id', to: "courses#show_control", as: "course_show_control"
  get "course/show_description/:id", to: "courses#show_description", as: "course_description"
  get "courses/consolidated_figures", to: "courses#consolidated_figures", as: "courses_consolidated_figures"
  get 'courses/hours', to: 'courses#hours', as: "courses_hours"
  post 'courses/create', to: "courses#create", as: "course_create"
  post 'courses/edit/:id', to: "courses#edit", as: "edit_course"
  post 'courses/edit_approved/:id', to: 'courses#update_approved', as: "course_approved"
  post 'courses/edit_status/:id', to: "courses#update_status", as: "edit_course_status"
  post 'courses/edit_packges/:id', to: 'courses#update_packages', as: "course_packages"
  post 'course/:id/add_data_sheet', to: "courses#add_product_to_data_sheet", as: "course_add_data_sheet"
  delete 'course/delete/:id', to: "courses#destroy", as: "course_delete"
  delete 'courses/delete_students/:id', to: 'courses#delete_students', as: "course_delete_students"
  #Professors
  get 'professors/show/:id', to: "professors#show", as: "professor_show"
  post 'professors/create', to: "professors#create", as: "professor_create"
  post 'professors/edit/:id', to: "professors#edit", as: "professor_update"
  delete 'professors/delete/:id', to: "professors#delete", as: "professor_delete"
  #Shelves
  get 'shelves/show/:id', to: "shelves#show", as: "shelf_show"
  # Students
  get 'students/index', to: "students#index", as: "students_index"
  get 'students/show/:id', to: "students#show", as: "student_show"
  get 'students/new', to: "students#new", as: "student_new"
  get 'students/download_file', to: "students#download_csv", as: 'students_csv'
  post 'students/create'
  post 'students/create_multiple', to: 'students#create_multiple', as: "students_multiple"
  post 'students/update/:id', to: "students#edit", as: "student_edit"
  post 'student/certified/:id', to: 'students#edit_certified', as: "student_certified"
  post 'student/online_certified/:id', to: 'students#edit_online_certified', as: "student_online_certified"
  delete 'students/destroy/:id', to: "students#delete", as: "student_delete"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Workers
  get "signup", to: "workers#new", as: "new_worker"
  post "signup", to: "workers#create"
  get "worker/:id", to: "workers#show", as: "worker_profile"
  get "workers/all", to: "workers#index", as: "workers_index"
  get "calendar", to: 'workers#calendar', as: "workers_calendar"
  get "charts", to: 'workers#charts', as: "workers_charts"
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
  # warehousesMovements
  get 'warehouseMovement/show/:id', to: "warehouse_movements#show", as: "warehouse_movement_show"
  post 'warehouseMovement/create', to: "warehouse_movements#create", as: 'warehouse_movement'

end
