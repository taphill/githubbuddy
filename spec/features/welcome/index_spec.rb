# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome/Index', type: :feature do
  context 'when a user syncs their account' do
    before do
      login_user
    end

    it 'fetchs a users stars', :vcr do
      visit welcome_index_path
      click_link 'Sync Account'

      expect(page).to have_current_path(user_root_path('taphill'))
    end
  end
end
