Rails.application.routes.draw do
  devise_for :users
  root 'home#page'
  get 'vehicles', to: 'vehicles#index'
  get 'vehicle/:id', to: 'vehicles#show', as: 'vehicle_show'
  # get 'vehicles/create'
  # get 'vehicles/update'
  delete 'vehicle/:id', to: 'vehicles#destroy', as: 'vehicle_delete'
end
