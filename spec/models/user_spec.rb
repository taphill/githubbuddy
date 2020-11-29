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
          user = User.create_from_omniauth(auth_hash)

          expect(User.from_omniauth(auth_hash)).to eq(user)
        end
      end

      context 'when the user does not exist' do
        it 'creates a new user' do
          expect(User.from_omniauth(auth_hash)).to eq(User.all.first)
        end
      end
    end

    describe '.create_from_omniauth' do
      it 'creates a user from an omniauth get request' do
        user = User.create_from_omniauth(auth_hash)

        expect(user.uid).to eq(auth_hash['uid'])
        expect(user.nickname).to eq(auth_hash['info']['nickname'])
        expect(user.name).to eq(auth_hash['info']['name'])
        expect(user.image).to eq(auth_hash['info']['image'])
      end
    end
  end
end
