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
      let(:auth_hash) do
        OmniAuth::AuthHash.new({
                                 'provider' => 'github',
                                 'uid' => '1285456',
                                 'info' => {
                                   'nickname' => 'adoug',
                                   'email' => 'adouglas@example.com',
                                   'name' => 'Aditya Douglas',
                                   'image' => 'https://static.thenounproject.com/png/340719-200.png'
                                 },
                                 'credentials' => {
                                   'token' => 'e596f957145e7b9c14',
                                   'expires' => 'false'
                                 }
                               })
      end

      it 'retrieves an existing user' do
        user = create(:user, github_id: 1_285_456)
        omniauth_user = User.from_omniauth(auth_hash)

        expect(user).to eq(omniauth_user)
      end

      it 'creates a new user if one does not exist' do
        expect(User.count).to eq(0)
        User.from_omniauth(auth_hash)

        expect(User.count).to eq(1)
        expect(User.first.github_id).to eq(1_285_456)
        expect(User.first.nickname).to eq('adoug')
        expect(User.first.image).to eq('https://static.thenounproject.com/png/340719-200.png')
      end
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

        expect(user1.tags).to eq(%w[ruby vim ruby])
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

    describe '#untagged_repos' do
      xit 'returns all repos without a tag' do
        user1 = create(:user, :with_repos, repo_count: 5)

        tag1 = create(:tag, name: 'ruby')
        tag2 = create(:tag, name: 'vim')

        create(:tagging, tag_id: tag1.id, user_repo_id: user1.user_repos[0].id)
        create(:tagging, tag_id: tag2.id, user_repo_id: user1.user_repos[1].id)

        expected = [user1.repos[4], user1.repos[3], user1.repos[2]]

        expect(user1.untagged_repos).to eq(expected)
      end
    end
  end
end
