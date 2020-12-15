# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserStar do
  let(:attr) do
    {
      name: 'mikejones',
      owner: { login: 'Mike Jones' },
      html_url: 'https://github.com/mikejones/iceage',
      description: 'Ice age, ice age...',
      language: 'Ruby',
      stargazers_count: 1_000_000,
      forks_count: 500_000
    }
  end

  let(:user_star) { described_class.new(attr) }

  it { expect(user_star).to be_a described_class }
  it { expect(user_star.name).to eq('mikejones') }
  it { expect(user_star.owner).to eq('Mike Jones') }
  it { expect(user_star.url).to eq('https://github.com/mikejones/iceage') }
  it { expect(user_star.description).to eq('Ice age, ice age...') }
  it { expect(user_star.language).to eq('Ruby') }
  it { expect(user_star.star_count).to eq(1_000_000) }
  it { expect(user_star.fork_count).to eq(500_000) }
end
