# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home/Index', type: :feature do
  describe 'Sign in' do
    context 'When successful' do
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

      it 'has current path of user_root_path' do
        VCR.use_cassette('Home/Index') do
          visit root_path
          click_link 'Sign In'
          expect(page).to have_current_path(user_root_path('adoug'))
        end
      end

      it 'has welcome flash message' do
        VCR.use_cassette('Home/Index') do
          visit root_path
          click_link 'Sign In'
          expect(page).to have_content('Hello adoug!')
        end
      end
    end

    context 'When unsuccessful' do
      before do
        OmniAuth.config.mock_auth[:github] = :invalid_credentials
        visit root_path
        click_link 'Sign In'
      end
      
      it { expect(page).to have_current_path(root_path) }
      it { expect(page).to have_content('Sign In failed') }
    end
  end
end
