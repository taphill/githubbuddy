# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:github_id) { |n| "100#{n}" }
    nickname { Faker::Internet.username }
  end
end
