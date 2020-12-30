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

  describe 'instance methods' do
    describe '#tags' do
      it 'returns an array user tag names' do
        user1 = create(:user, :with_repos, repo_count: 3)
        user2 = create(:user, :with_repos, repo_count: 3)

        tag1 = create(:tag, name: 'ruby')
        tag2 = create(:tag, name: 'vim')
        tag3 = create(:tag, name: 'shell')

        create(:tagging, tag_id: tag1.id, user_repo_id: user1.user_repos[0].id)
        create(:tagging, tag_id: tag2.id, user_repo_id: user1.user_repos[1].id)
        create(:tagging, tag_id: tag1.id, user_repo_id: user1.user_repos[2].id)
        create(:tagging, tag_id: tag3.id, user_repo_id: user2.user_repos[0].id)

        expect(user1.tags).to eq(['ruby', 'vim', 'ruby'])
        expect(user2.tags).to eq(['shell'])
      end
    end

    describe '#repos_with_tag(tag_name)' do
      it 'returns all repos with a specific tag' do
        user1 = create(:user, :with_repos, repo_count: 3)
        user2 = create(:user, :with_repos, repo_count: 3)

        tag1 = create(:tag, name: 'ruby')
        tag2 = create(:tag, name: 'vim')
        tag3 = create(:tag, name: 'shell')

        create(:tagging, tag_id: tag1.id, user_repo_id: user1.user_repos[0].id)
        create(:tagging, tag_id: tag2.id, user_repo_id: user1.user_repos[1].id)
        create(:tagging, tag_id: tag1.id, user_repo_id: user1.user_repos[2].id)
        create(:tagging, tag_id: tag3.id, user_repo_id: user2.user_repos[0].id)
        create(:tagging, tag_id: tag1.id, user_repo_id: user2.user_repos[1].id)

        expect(user1.repos_with_tag('ruby')).to eq([user1.repos[0], user1.repos[2]])
      end
    end
  end
end
