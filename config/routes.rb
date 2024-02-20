Rails.application.routes.draw do
  devise_for :models
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'dashboard#login'


  resources :users do
    resources :tasks
  end
end
