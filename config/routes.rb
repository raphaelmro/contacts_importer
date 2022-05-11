Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  root 'contacts#index'
  resources :contacts, only: [:index, :create, :new]
  resources :csv_import do
    collection { post :import }
  end
end

