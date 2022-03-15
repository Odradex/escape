Rails.application.routes.draw do
  resources :services
  resources :reservations
  resources :rooms
  resources :organizations
  resources :calendar_events
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/organizations/:id/rooms', to: 'organizations#rooms'
  get '/total_service_price', to: 'services#total_price'
  post '/add_event_to_reservation', to: 'reservations#add_event_to_reservation'
  mount Commontator::Engine => '/commontator'
end
