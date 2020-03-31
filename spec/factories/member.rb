FactoryBot.define do
  factory :member do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    campaign
  end
end
