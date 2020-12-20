# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "100#{n}" }
    nickname { Faker::Internet.username }
  end
end
