# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users can see starred repos', type: :feature do
  describe 'When an authenticated user naviagtes to users/index', :vcr do
    before do
      login_user
    end

    it { expect(page).to have_content('junegunn / fzf.vim') }
    it { expect(page).to have_content('vim / vim') }
    it { expect(page).to have_content('alacritty / alacritty') }
  end
end
