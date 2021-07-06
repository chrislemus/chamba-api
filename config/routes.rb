Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: [:create]
    resources :customers, only: [:create, :index, :show, :update, :destroy]
    resources :invoices, only: [:create, :index, :show, :update, :destroy]
    resources :events, only: [:create, :index, :show, :update, :destroy]
    post '/login', to: 'auth#create'
    get '/profile', to: 'users#profile'
  end
end
