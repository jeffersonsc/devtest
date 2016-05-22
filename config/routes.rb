Rails.application.routes.draw do
  require 'sidekiq/web'
  
  
  #Set default routes
  root to: 'occurrences#index'

  resources :occurrences, only: [:index, :show]


  mount Sidekiq::Web, at: '/sidekiq'
end
