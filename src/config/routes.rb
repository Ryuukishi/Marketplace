Rails.application.routes.draw do
  devise_for :users
  root 'home#page'
  get 'vehicles', to: 'vehicles#index'
  get 'mycars', to: 'vehicles#mycars', as: 'mycars'
  get 'vehicle/:id', to: 'vehicles#show', as: 'vehicle'
  get 'vehicles/new', to: 'vehicles#new', as: 'new_vehicle'
  post 'vehicles', to: 'vehicles#create'
  get 'vehicle/:id/edit', to: 'vehicles#edit', as: 'edit_vehicle'
  patch 'vehicle/:id/', to: 'vehicles#update', as: 'update_vehicle'
  delete 'vehicle/:id', to: 'vehicles#destroy', as: 'delete_vehicle'
end
