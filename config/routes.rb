Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :jobs, only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:new, :create, :show, :edit, :update]
  resources :categories, only: [:new, :create, :show]
  resources :job_types, only: [:show, :new, :create]

  namespace :api, defaults: { format: 'json' } do
    resources :jobs, only: [:index, :show, :companies, :categories]
    resources :companies, only: [:index, :show, :jobs] do
      member do
        get 'jobs'
      end
    end
    resources :categories, only: [:index, :show] do
      member do
        get 'jobs'
      end
    end
  end
end
