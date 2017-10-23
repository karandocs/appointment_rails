Rails.application.routes.draw do
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :appointments
  resources :patients
  resources :doctors
  root to: "visitors#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
