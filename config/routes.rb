require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  mount Sidekiq::Web => '/sidekiq'

  root "questions#index"

  concern :likable do
    resource :likings
  end

  resources :answers, concerns: :likable

  resources :questions, concerns: :likable do
    resources :answers
  end


  direct(:embeded_answer) do |answer|
    url_for [answer.question, anchor: "answer_#{answer.id}"]
  end

  resources :search, only: :index
end
