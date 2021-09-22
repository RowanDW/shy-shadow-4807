Rails.application.routes.draw do

  resources :plots, only: [:index]
  resources :plant_locations, only: [:destroy]
end
