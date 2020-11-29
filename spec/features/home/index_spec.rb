require 'rails_helper'

RSpec.describe "Home/Index", type: :feature do
  describe 'login' do
    before do
      OmniAuth.config.mock_auth[:github] = nil
      OmniAuth.config.mock_auth[:github] = {
        'provider' => 'github',
        'uid' => '1285456',
        'info' => {
          'nickname' => 'adoug',
          'email' => 'adouglas@example.com',
          'name' => 'Aditya Douglas',
          'image' => 'https://static.thenounproject.com/png/340719-200.png'
        },
        'credentials' => {
          'token' => 'e596f957145e7b9c14',
          'expires' => 'false'
        }
      }
    end

    it 'can log in user with GitHub account' do
      visit root_path
      click_link 'Link your GitHub account!'

      expect(page).to have_content("Hello adoug!")
    end
  end
end