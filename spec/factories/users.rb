# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:github_id) { |n| "100#{n}" }
    nickname { Faker::Internet.username }
    image { 'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482930.jpg' }
    github_token { "OfY#{Faker::Number.number(digits: 10)}nDDn" }
    auth_token { Faker::Number.number(digits: 10) }

    trait :with_repos do
      transient do
        repo_count { 3 }
      end

      after(:create) do |user, evaluator|
        user.repos << create_list(:repo, evaluator.repo_count)
      end
    end
  end
end
