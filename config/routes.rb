Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  resources :users

  namespace :admin do
    get '/', to: "dashboard#index"
    resources :categories, :only => [:index]
    resources :images, :only => [:index]
  end
end
