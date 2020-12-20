# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SyncFacade, type: :facade do
  describe '.fetch_user_stars()' do
    let(:user) { create(:user, nickname: 'taphill') }

    before do
      described_class.fetch_user_stars(user)
    end

    it 'creates user repos', :vcr do
      expect(UserRepo.all.count).to eq(67)
    end

    it 'creates repos', :vcr do
      expect(Repo.all.count).to eq(67)
      expect(Repo.last.name).to eq('SOUL')
    end
  end
end
