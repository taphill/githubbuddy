# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_uniqueness_of(:uid).case_insensitive }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_uniqueness_of(:nickname) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_secure_token(:auth_token) }
  end

  describe 'class methods' do
    describe '.from_omniauth' do
      context 'when the user already exists' do
        it 'returns the user' do
          user = described_class.create_from_omniauth(mock_auth_hash)

          expect(described_class.from_omniauth(mock_auth_hash)).to eq(user)
        end
      end

      context 'when the user does not exist' do
        it 'creates a new user' do
          expect(described_class.from_omniauth(mock_auth_hash)).to eq(described_class.all.first)
        end
      end
    end

    describe '.create_from_omniauth' do
      let(:user) { described_class.create_from_omniauth(mock_auth_hash) }

      it { expect(user.uid).to eq(mock_auth_hash['uid']) }
      it { expect(user.nickname).to eq(mock_auth_hash['info']['nickname']) }
      it { expect(user.name).to eq(mock_auth_hash['info']['name']) }
      it { expect(user.image).to eq(mock_auth_hash['info']['image']) }
    end
  end
end
