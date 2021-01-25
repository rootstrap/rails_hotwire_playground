Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :boards do
    resources :columns, only: %i[edit create update destroy] do
      resources :cards, only: %i[edit create update destroy]
    end
  end
end
