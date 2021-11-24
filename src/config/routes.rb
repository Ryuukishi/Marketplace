Rails.application.routes.draw do
  devise_for :users
  root 'home#page'
  get 'vehicles', to: 'vehicles#vehicles_index'
  get 'mycars', to: 'vehicles#mycars', as: 'mycars'
  get 'vehicle/:id', to: 'vehicles#show', as: 'vehicle'
  get 'vehicles/new', to: 'vehicles#new', as: 'new_vehicle'
  post 'vehicles', to: 'vehicles#create'
  get 'vehicle/:id/edit', to: 'vehicles#edit', as: 'edit_vehicle'
  patch 'vehicle/:id/', to: 'vehicles#update', as: 'update_vehicle'
  delete 'vehicle/:id', to: 'vehicles#destroy', as: 'delete_vehicle'
  get 'bookings/index', to: 'bookings#bookings_index', as: 'bookings'
  # get 'vehicle/:id', to: 'bookings#new', as: 'new_booking'
  post 'vehicle/:id', to: 'bookings#create', as: 'new_booking'
  get 'booking/:id', to: 'bookings#booking_show', as: 'booking'
  delete 'booking/:id', to: 'bookings#destroy', as: 'delete_booking'
end
