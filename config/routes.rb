Rails.application.routes.draw do
  resources :places, only: [:index, :new, :create, :show]
  root 'places#index'
end
