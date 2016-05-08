Rails.application.routes.draw do
  root 'static_pages#index'

  resources :customers, except: :show
  resources :categories do
    resources :products, only: [:new, :create]
  end

  resources :products, only: [:destroy]
end
