# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users/Index', type: :feature do
  context 'when I visit the user/index page as a user' do
    it 'has repo details' do
      VCR.use_cassette('User/Index') do
        login_user
        expect(page).to have_link('junegunn / fzf')
      end
    end
  end
end
