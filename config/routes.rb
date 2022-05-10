Rails.application.routes.draw do
  devise_for :users
  root 'contacts#index'
  resources :contacts, only: [:index, :create, :new]
  resources :csv_import do
    collection { post :import }
  end
end

