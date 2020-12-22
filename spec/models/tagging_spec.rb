require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:tag_id) }
    it { is_expected.to validate_presence_of(:user_repo_id) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:tag) }
    it { is_expected.to belong_to(:user_repo) }
  end
end
