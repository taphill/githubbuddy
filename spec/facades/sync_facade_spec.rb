# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SyncFacade, type: :facade do
  describe '.fetch_user_stars()' do
    let(:user) do
      create(:user, nickname: 'taphill', github_token: Rails.application.credentials.test[:github_api_token])
    end

    before do
      described_class.fetch_user_stars(user)
    end

    it 'creates user repos', :vcr do
      expect(UserRepo.all.count).to eq(91)
    end

    it 'creates repos', :vcr do
      expect(Repo.all.count).to eq(91)
      expect(Repo.last.name).to eq('SOUL')
    end
  end
end
