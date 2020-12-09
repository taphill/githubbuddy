require 'rails_helper'

RSpec.describe GitHubService do
  describe 'class methods' do
    context '.user_stars(user_nickname)' do
      it "returns a user's starred repos" do
        VCR.use_cassette('github_service_spec') do
          user_stars = GitHubService.user_stars('taphill') 
          user_stars_data = user_stars.first

          expect(user_stars_data[:owner]).to have_key :login
          expect(user_stars_data).to have_key :name
          expect(user_stars_data).to have_key :html_url
          expect(user_stars_data).to have_key :description
          expect(user_stars_data).to have_key :language
          expect(user_stars_data).to have_key :stargazers_count
          expect(user_stars_data).to have_key :forks_count
        end
      end
    end
  end
end
