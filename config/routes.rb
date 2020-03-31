# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  mount Sidekiq::Web => '/sidekiq'
end
