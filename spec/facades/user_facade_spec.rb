require 'rails_helper'

RSpec.describe UserFacade, type: :facade do
  describe '.user_stars(user_nickname)', :vcr do
    let(:star_data) { described_class.user_stars('taphill') }

    it { expect(star_data).to be_a(Array) }
    it { expect(star_data.last).to be_a(UserStar) }
    it { expect(star_data.last.name).to eq('rubocop') }
    it { expect(star_data.last.owner).to eq('rubocop-hq') }
    it { expect(star_data.last.url).to eq('https://github.com/rubocop-hq/rubocop') }
    it { expect(star_data.last.description).to eq('A Ruby static code analyzer and formatter, based on the community Ruby style guide.') }
    it { expect(star_data.last.star_count).to eq(11195) }
    it { expect(star_data.last.fork_count).to eq(2553) }
  end
end

