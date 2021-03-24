# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users/Index', type: :feature do
  describe 'when a user has stars' do
    before do
      login_user
    end

    it 'has repo details' do
      VCR.use_cassette('User/with_stars') do
        visit welcome_index_path
        click_link 'Sync Account'

        expect(page).to have_css('.user-star', count: 76)

        within(all('.user-star').last) do
          expect(page).to have_link('soul-lang / SOUL')
          expect(page).to have_content('The SOUL programming language and API')
          expect(page).to have_link('Add tags')
        end
      end
    end
  end

  describe 'when a user has no stars' do
    before do
      login_user_with_no_stars
    end

    it 'renders the user/no_stars view' do
      VCR.use_cassette('User/with_no_stars') do
        visit welcome_index_path
        click_link 'Sync Account'

        expect(page).to have_content("We didn't find any stars")
      end
    end
  end
end
