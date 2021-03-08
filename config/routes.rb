Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  authenticate :admin_user do
    mount Flipper::UI.app(Flipper) => '/flipper'
  end

  resources :boards do
    resources :columns, only: %i[edit create update destroy] do
      resources :cards, only: %i[edit create update destroy]
    end
  end

  resources :gallery, only: %i[index] do
    post :images, on: :collection
  end

  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
