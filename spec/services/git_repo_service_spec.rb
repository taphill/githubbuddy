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
  end
end
