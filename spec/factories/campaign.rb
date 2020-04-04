# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    user
    status { :pending }
    locale { "#{Faker::Address.city}, #{Faker::Address.street_address}" }
    event_date { Faker::Date.in_date_period }
    event_hour { rand(24).to_s }
  end
end
