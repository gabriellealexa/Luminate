Rails.application.routes.draw do

  root to: 'pages#index'
  #resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :matches]
  resources :sun_signs, only: [:index, :show]
  resources :connections, only: [:index, :new, :show]

  get "welcome", to: "pages#welcome", as: "welcome"
  resources :pages, only: [:welcome]

  #image upload
  post '/upload' => 'users#upload'

  #user edit
  post '/users', to: 'users#create' #create
  get "/users/:id", to: "users#show", as: "user" #show
  get "/users/:id/edit", to: 'users#edit', as: "edit_user"
  patch "/users/:id", to: 'users#update' #update

  delete "/users/:id", to: 'userss#destroy' #destroy

  #session routes
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"
  get "sessions", to: "sessions#index"

  #connection routes
  post '/connections/:id' => 'connections#create'
  get '/connections/:id' => 'connections#show'


end
