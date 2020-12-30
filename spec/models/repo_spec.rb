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
    it { is_expected.to have_many(:tags).through(:user_repos) }
  end

  describe 'instance methods' do
    describe '.search(query)' do
      it 'returns all user repos that match similar to the query ignoring special characters' do
        user1 = create(:user)
        user2 = create(:user)

        repo1 = create(:repo, name: 'vim')
        repo2 = create(:repo, name: 'nvim-lua-guide')
        repo3 = create(:repo, name: 'lua')
        repo4 = create(:repo, name: 'fzf')
        repo5 = create(:repo, name: 'not-vim')

        create(:user_repo, user: user1, repo: repo1)
        create(:user_repo, user: user1, repo: repo2)
        create(:user_repo, user: user1, repo: repo3)
        create(:user_repo, user: user1, repo: repo4)
        create(:user_repo, user: user2, repo: repo5)

        expect(Repo.search(query: '!LuA, %&vIm', user_id: user1.id)).to eq([repo1, repo2, repo3])
      end
    end
  end
end
