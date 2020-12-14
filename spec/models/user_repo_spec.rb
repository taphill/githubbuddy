require 'rails_helper'

RSpec.describe UserRepo, type: :model do
  describe 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:repo) }
  end
end
