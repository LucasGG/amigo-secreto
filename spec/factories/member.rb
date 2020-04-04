# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    campaign
  end
end
