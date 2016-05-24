Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'
  
  resources :occurrences, only: [:index, :show]
  resources :users

  #Set default routes
  root to: 'occurrences#index'
  mount Sidekiq::Web, at: '/sidekiq'
end
