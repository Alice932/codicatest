Rails.application.routes.draw do
  root 'appointments#index'
  resources :patients
  resources :physicians
  resources :appointments
end
