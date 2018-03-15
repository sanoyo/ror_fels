Rails.application.routes.draw do
  namespace :admin do
    get 'categories/new'
  end

  namespace :admin do
    get 'categories/show'
  end

  namespace :admin do
    get 'categories/create'
  end

  namespace :admin do
    get 'categories/destroy'
  end

  namespace :admin do
    get 'categories/update'
  end

  root 'static_pages#home'

  resources :users, except: [:new]
  resources :categories

  namespace :admin do
  	resources :categories
  end

  get    '/dashboard', to: 'users#dashboard'
  get    '/signup',    to: 'users#new'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
end
