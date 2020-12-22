# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it { is_expected.to validate_presence_of(:github_id) }
    it { is_expected.to validate_uniqueness_of(:github_id) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_uniqueness_of(:nickname) }
    it { is_expected.to have_secure_token(:auth_token) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:user_repos) }
    it { is_expected.to have_many(:repos).through(:user_repos) }
  end

  describe 'class methods' do
    describe '.from_omniauth' do
      context 'when the user already exists it returns the user' do
        # Create user
        let(:user_created) { described_class.create_from_omniauth(mock_auth_hash) }

        # Make sure we are finding that user
        let(:user_found) { described_class.from_omniauth(user_created) }

        it { expect(user_found).to be_a(described_class) }
        it { expect(user_found).to eq(user_created) }
      end

      context 'when the user does not exist it creates a new user' do
        it { expect(described_class.from_omniauth(mock_auth_hash)).to eq(described_class.all.first) }
      end
    end

    describe '.create_from_omniauth' do
      let(:user) { described_class.create_from_omniauth(mock_auth_hash) }

      it { expect(user.github_id).to eq(mock_auth_hash['uid'].to_i) }
      it { expect(user.nickname).to eq(mock_auth_hash['info']['nickname']) }
      it { expect(user.image).to eq(mock_auth_hash['info']['image']) }
    end
  end
end
