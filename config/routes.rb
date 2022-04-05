Rails.application.routes.draw do
  devise_for :users
  root 'appointments#index'
  resources :patients
  resources :doctors
  resources :appointments
end
