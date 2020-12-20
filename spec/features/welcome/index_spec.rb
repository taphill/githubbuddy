# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome/Index', type: :feature do
  context 'when a user syncs their account' do
    before do
      login_user
    end

    it 'takes user to the user/index' do
      VCR.use_cassette('Welcome/Index') do
        visit welcome_index_path
        click_link 'Sync Account'

        expect(page).to have_current_path(user_root_path('taphill'))
      end
    end

    it 'fetchs all user stars' do
      VCR.use_cassette('Welcome/Index') do
        visit welcome_index_path
        click_link 'Sync Account'

        expect(page).to have_css('.user-star', count: 67)

        within(all('.user-star').last) do
          expect(page).to have_link('soul-lang / SOUL')
          expect(page).to have_content('The SOUL programming language and API')
          expect(page).to have_link('Add tags')
        end
      end
    end
  end
end
