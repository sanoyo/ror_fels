Rails.application.routes.draw do

  root 'static_pages#home'

  resources :users, except: [:new]

  namespace :admin do
  	resources :categories do
      resources :words
    end
  end

  get    '/categories', to: 'categories#index'
  get    '/dashboard',  to: 'users#dashboard'
  get    '/signup',     to: 'users#new'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'
end
