Rails.application.routes.draw do

  resources :plots, only: [:index]
  resources :gardens, only: [:show]
  resources :plant_locations, only: [:destroy]
end
