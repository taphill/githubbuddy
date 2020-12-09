require 'rails_helper'

RSpec.describe "Users/Index", type: :feature do
  describe 'As an authenticated user' do
    context 'When I visit the user index page' do
      before do
        login_user
      end

      it 'has repo details' do
        VCR.use_cassette('user_starred_repos') do
          visit stars_path
          
          expect(page).to have_link('junegunn / fzf')
        end
      end
    end
  end
end
