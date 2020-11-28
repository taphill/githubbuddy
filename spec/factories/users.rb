FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "100#{n}" }
    sequence(:token) { |n| "f9dr8#{n}" }
    nickname { Faker::Internet.username }
    name { Faker::Name.name }
  end
end
