# frozen_string_literal: true

FactoryBot.define do
  factory :repo do
    sequence(:github_id) { |n| "#{n}" }
    name { Faker::Name.last_name }
    owner { Faker::Internet.username }
    url { Faker::Internet.url(host: 'github.com') }
  end
end
