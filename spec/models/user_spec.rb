# frozen_string_literal: true

require 'rails_helper'
require './spec/support/omniauth_helpers'

RSpec.configure do |c|
  c.include OmniauthHelpers
end

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_uniqueness_of(:uid).case_insensitive }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_uniqueness_of(:nickname) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'class methods' do
    describe '.from_omniauth' do
      context 'when the user already exists' do
        it 'returns the user' do
          user = described_class.create_from_omniauth(omniauth_request)

          expect(described_class.from_omniauth(omniauth_request)).to eq(user)
        end
      end

      context 'when the user does not exist' do
        it 'creates a new user' do
          expect(described_class.from_omniauth(omniauth_request)).to eq(described_class.all.first)
        end
      end
    end

    describe '.create_from_omniauth' do
      let(:user) { described_class.create_from_omniauth(omniauth_request) }

      it { expect(user.uid).to eq(omniauth_request['uid']) }
      it { expect(user.nickname).to eq(omniauth_request['info']['nickname']) }
      it { expect(user.name).to eq(omniauth_request['info']['name']) }
      it { expect(user.image).to eq(omniauth_request['info']['image']) }
    end
  end
end
