FactoryBot.define do
  factory :campaign do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    user
  end
end
