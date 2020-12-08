require 'rails_helper'

RSpec.feature "Users can see starred repos", type: :feature do
  before do
    login_user
  end
 
  scenario 'When an authenticated user naviagtes to users/index' do
    VCR.use_cassette('user_starred_repos') do
      visit stars_path 

      expect(page).to have_content('junegunn / fzf.vim')
      expect(page).to have_content('vim / vim')
      expect(page).to have_content('alacritty / alacritty')
    end
  end
end
