require 'rails_helper'

RSpec.describe Repo, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:github_repo_id) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:user_repos) }
    it { is_expected.to have_many(:users).through(:user_repos) }
  end
end
