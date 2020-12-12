# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserStar do
  let(:user_star) { described_class.new(mock_repo_data) }

  it { expect(user_star).to be_a described_class }
  it { expect(user_star.name).to eq('travis.rb') }
  it { expect(user_star.owner).to eq('travis-ci') }
  it { expect(user_star.url).to eq('https://github.com/travis-ci/travis.rb') }
  it { expect(user_star.description).to eq(mock_repo_data[:description]) }
  it { expect(user_star.language).to eq('Ruby') }
  it { expect(user_star.star_count).to eq(1525) }
  it { expect(user_star.fork_count).to eq(415) }
end
