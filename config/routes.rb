Rails.application.routes.draw do

  namespace :admin do
  get 'dashboard/index'
  end

  devise_for :users
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :products
  end

  resources :products, only: [:index, :show]
  root 'products#index'
end
