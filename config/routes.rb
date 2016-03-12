require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "logins#index"
  get 'logins/index'

  resources :reservations, only: [:index]
  get "reservations/get_events"
  get "reservations/get_resources"

  resources :hosts
  resources :temp_staffs, except: [:show]
  get "temp_staffs/thanks"
end
