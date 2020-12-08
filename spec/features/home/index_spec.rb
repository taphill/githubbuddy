# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home/Index', type: :feature do
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

      visit root_path
      click_link 'Sign In'
    end

    context 'when successful' do
      it { expect(page).to have_content('Hello adoug!') }
    end

    context 'when unsuccessful' do
      before do
        OmniAuth.config.mock_auth[:github] = :invalid_credentials
      end
      
      it { expect(page).to have_current_path(root_path) }
    end
  end
end
