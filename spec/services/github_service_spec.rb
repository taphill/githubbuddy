require 'rails_helper'

RSpec.describe GitHubService do
  describe 'class methods' do
    context '.user_stars(user_nickname)' do
      it "returns a user's starred repos" do
        VCR.use_cassette('github_service_spec') do
          repos = GitHubService.user_stars('taphill') 
          repo_data = repos.first

          expect(repo_data[:owner]).to have_key :login
          expect(repo_data).to have_key :name
          expect(repo_data).to have_key :html_url
          expect(repo_data).to have_key :description
          expect(repo_data).to have_key :language
          expect(repo_data).to have_key :stargazers_count
          expect(repo_data).to have_key :forks_count
        end
      end
    end
  end
end
