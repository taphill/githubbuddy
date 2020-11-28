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
  end

  describe 'class methods' do
    describe '.from_omniauth' do
    end

    describe '.create_from_omniauth' do
    end
  end
end
