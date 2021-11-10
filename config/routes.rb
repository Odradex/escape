Rails.application.routes.draw do
  resources :services
  resources :reservations
  resources :rooms
  resources :organizations
  resources :calendar_events
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
