Rails.application.routes.draw do
  mount_devise_token_auth_for 'Usuario', at: 'auth'
  resources :categories
  resources :registers
  resources :household_appliances
  resources :outlets
  resources :rooms
  resources :domiciles
  resources :users
  resources :test
  resources :ldap
  
  get 'rooms/:room_id/outlets', to: 'outlets#show_mine', as: :rooms_outlets
  get 'users/:user_id/domiciles', to: 'domiciles#my_house', as: :user_house
  get 'domiciles/:domicile_id/rooms', to: 'rooms#my_rooms', as: :domicile_rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
