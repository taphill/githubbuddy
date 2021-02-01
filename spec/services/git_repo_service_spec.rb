# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GitRepoService, type: :service do
  describe 'class methods' do
    describe '.user_stars(user_nickname) when passed a valid nickname', :vcr do
      let(:user_stars_data) { described_class.user_stars('taphill') }
      let(:first_result) { user_stars_data.first }

      it { expect(user_stars_data).to be_a(Array) }

      it { expect(first_result).to have_key :name }
      it { expect(first_result[:name]).to be_a(String) }

      it { expect(first_result).to have_key :owner }
      it { expect(first_result[:owner]).to be_a(Hash) }

      it { expect(first_result[:owner]).to have_key :login }
      it { expect(first_result[:owner][:login]).to be_a(String) }

      it { expect(first_result).to have_key :html_url }
      it { expect(first_result[:html_url]).to be_a(String) }

      it { expect(first_result).to have_key :description }
      it { expect(first_result[:description]).to be_a(String) }
    end

    describe '.latest_release(owner, repo)', :vcr do
      let(:result) { described_class.latest_release(owner: 'Homebrew', repo: 'brew', token: nil) }

      it { expect(result).to be_a(Hash) }

      it { expect(result).to have_key(:html_url) }
      it { expect(result[:html_url]).to be_a(String) }

      it { expect(result).to have_key(:tag_name) }
      it { expect(result[:tag_name]).to be_a(String) }

      it { expect(result).to have_key(:created_at) }
      it { expect(result[:created_at]).to be_a(String) }

      it { expect(result).to have_key(:published_at) }
      it { expect(result[:published_at]).to be_a(String) }

      it { expect(result).to have_key(:body) }
      it { expect(result[:body]).to be_a(String) }
    end
  end
end
