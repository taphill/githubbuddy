# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repo, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:repo) }

    it { is_expected.to validate_presence_of(:github_id) }
    it { is_expected.to validate_uniqueness_of(:github_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:user_repos) }
    it { is_expected.to have_many(:users).through(:user_repos) }
  end
end
