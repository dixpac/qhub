Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "questions#index"

  resources :questions do
    resources :answers, except: [:index, :show]
  end

  post   'likes/:sgid', to: 'likes#create', as: :likes
  delete 'likes/:sgid', to: 'likes#destroy'

  direct(:embeded_answer) do |answer|
    url_for [answer.question, anchor: "answer_#{answer.id}"]
  end

  resources :search, only: :index
end
