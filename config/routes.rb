Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :jobs, only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:new, :create, :show, :edit, :update]
  resources :categories, only: [:new, :create, :show]
  resources :job_types, only: [:show]

  namespace :api, defaults: { format: 'json' } do
    resources :jobs, only: [:show, :new, :create, :edit, :update]
    resources :companies, only: [:new, :create, :show, :edit, :update]
    resources :categories, only: [:new, :create, :show]
    resources :job_types, only: [:show]
  end
end
