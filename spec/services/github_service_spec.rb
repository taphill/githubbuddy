require 'rails_helper'

RSpec.describe GitHubService do
  describe 'class methods' do
    context '.user_stars(user_nickname)' do
      it "returns a user's starred repos" do
        VCR.use_cassette('github_service_spec') do
          repos = GitHubService.user_stars('taphill') 
require 'pry'; binding.pry
        end
      end
    end
  end
end
