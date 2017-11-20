Rails.application.routes.draw do
  resources :categories
  resources :registers
  resources :household_appliances
  resources :outlets
  resources :rooms
  resources :domiciles
  resources :users
  resources :test
  resources :ldap
  resources :test2
  wash_out :wselectro

  get 'rooms/:room_id/outlets', to: 'outlets#show_mine', as: :rooms_outlets
  get 'users/:user_id/rooms', to: 'rooms#my_rooms', as: :user_rooms
  get 'users/:user_id/categories', to: 'categories#my_categories', as: :user_categories
  get 'users/:user_id/household_appliances', to: 'household_appliances#my_appliances', as: :user_appliances
  get 'users/:user_id/current_consumption', to: 'household_appliances#current_consumption', as: :user_current_consumption
  get 'users/search/:email', to: 'users#current_user', constraints: { :email => /.+@.+\..*/ }, as: :current_user
  get 'categories/:category_id/household_appliances', to: 'household_appliances#in_category', as: :category_appliances
  get 'users/:user_id/total_consumption', to: 'household_appliances#total_consumption', as: :user_total_consumption
  get 'outlets/:outlet_id/consumption', to: 'outlets#consumption', as: :outlet_consumption
  get 'users/:user_id/percent', to: 'outlets#percent', as: :user_percent
  get 'outlets/:outlet_id/household_appliances', to: 'outlets#my_appliance', as: :outlet_appliance
  get 'users/:user_id/available', to: 'household_appliances#appliances_available', as: :user_available
  post 'categories/:category_id/turn', to: 'categories#turn', as: :category_turn
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
