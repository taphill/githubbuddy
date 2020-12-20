# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserRepo, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user_repo) }

    it { is_expected.to validate_presence_of(:repo_id) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:repo_id) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:repo) }
  end
end
