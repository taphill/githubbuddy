# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tags/New', type: :feature do
  context 'when a user clicks link to add a new tag' do
    let(:user) { create(:user, :with_repos) }
    let(:repo) { user.repos.first }

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'routes to the new tag page' do
      visit user_root_path(user.nickname)

      within(first('.user-star')) do
        click_link 'Add tags'
      end

      expect(page).to have_current_path(new_tags_path(repo.id))
    end

    xit 'allows user to add tags' do
      visit user_root_path(user.nickname)

      within(first('.user-star')) do
        click_link 'Add tags'
      end

      fill_in :tags, with: 'ruby, rails, vim, this repo is awesome'
      click_button 'Add'

      expect(page).to have_current_path(user_root_path(user.nickname))

      within(first('.user-star')) do
        expect(page).to have_link('ruby')
        expect(page).to have_content('rails')
        expect(page).to have_content('vim')
        expect(page).to have_content('this repo is awesome')
      end
    end
  end
end
