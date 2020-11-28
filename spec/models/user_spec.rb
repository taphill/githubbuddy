require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it { should validate_presence_of(:uid) }
    it { should validate_uniqueness_of(:uid).case_insensitive }

    it { should validate_presence_of(:nickname) }
    it { should validate_uniqueness_of(:nickname) }

    it { should validate_presence_of(:name) }
  end
end
