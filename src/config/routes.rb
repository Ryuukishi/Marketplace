Rails.application.routes.draw do
  devise_for :users
  root 'home#page'
  get 'vehicles', to: 'vehicles#index'
  get 'vehicle/:id', to: 'vehicles#show', as: 'vehicle'
  get 'vehicles/new', to: 'vehicles#new', as: 'new_vehicle'
  post 'vehicles', to: 'vehicles#create'
  delete 'vehicle/:id', to: 'vehicles#destroy', as: 'delete_vehicle'
end
