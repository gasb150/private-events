Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users
  root 'events#index'
  resources :events
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
