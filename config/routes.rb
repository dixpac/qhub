require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  mount Sidekiq::Web => '/sidekiq'

  root "questions#index"

  resources :questions do
    resources :answers
  end
end
