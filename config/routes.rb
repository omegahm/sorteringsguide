Sorteringsguide::Application.routes.draw do
  resources :signs
  resources :recycling_centers

  resources :users, controller: :admins, except: [:show]

  put 'send_suggestion_mail', to: 'home#send_suggestion_mail'

  devise_for :admins

  devise_scope :admin do
    get 'admin', to: 'devise/sessions#new'
  end

  root 'home#index'
end
