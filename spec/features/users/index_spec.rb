require 'rails_helper'

RSpec.describe "Users/Index", type: :feature do
  describe 'As an authenticated user' do
    context 'When I visit the user index page' do
      it 'has repo details' do
        VCR.use_cassette('User/Index') do
          login_user
          expect(page).to have_link('junegunn / fzf')
        end
      end
    end
  end
end
