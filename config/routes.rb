Sorteringsguide::Application.routes.draw do
  resources :signs

  resources :recycling_centers

  devise_for :admins

  root 'home#index'
end
