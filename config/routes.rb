Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "questions#index"

  resources :questions do
    resources :answers
  end
end
