Rails.application.routes.draw do
  root 'static_pages#index'

  resources :customers, except: :show
  resources :categories
end
