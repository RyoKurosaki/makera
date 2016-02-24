require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  root to: "logins#index"
  get 'logins/index'

  get 'logins/show'

  resources :reservations, only: [:index]
  get "reservations/get_events"
  get "reservations/get_resources"
end
