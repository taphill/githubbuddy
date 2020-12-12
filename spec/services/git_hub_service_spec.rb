# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GitHubService, type: :service do
  describe 'class methods' do
    describe '.user_stars(user_nickname)', :vcr do
      let(:user_stars) { described_class.user_stars('taphill') }
      let(:user_stars_data) { user_stars.first }

      it { expect(user_stars_data[:owner]).to have_key :login }
      it { expect(user_stars_data).to have_key :name }
      it { expect(user_stars_data).to have_key :html_url }
      it { expect(user_stars_data).to have_key :description }
      it { expect(user_stars_data).to have_key :language }
      it { expect(user_stars_data).to have_key :stargazers_count }
      it { expect(user_stars_data).to have_key :forks_count }
    end
  end
end
