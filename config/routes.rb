# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'pages/home'

  resources :campaigns, except: [:new] do
    post 'raffle', on: :member
  end

  get 'members/:token/opened', to: 'members/opened'

  resources :members, only: [:create, :destroy, :update]

  mount Sidekiq::Web => '/sidekiq'
end
