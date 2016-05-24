Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }
  require 'sidekiq/web'
  
  resources :occurrences, only: [:index, :show]
  resources :users

  #Set default routes
  root to: 'occurrences#index'
  mount Sidekiq::Web, at: '/sidekiq'
end
