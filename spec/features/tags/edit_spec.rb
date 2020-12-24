# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tags/Edit', type: :feature do
  context 'when a user clicks link to remove tags' do
    let(:user) { create(:user, :with_repos) }
    let(:repo) { user.repos.first }

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'routes to the edit tags page' do
      visit user_root_path(user.nickname)

      within(first('.user-star')) do
        click_link 'Remove tags'
      end

      expect(page).to have_current_path(edit_tags_path(repo.id))
    end

    it 'allows user to remove tags' do
      visit user_root_path(user.nickname)

      within(first('.user-star')) do
        click_link 'Add tags'
      end

      fill_in :tags, with: 'ruby, rails, vim'
      click_button 'Add'

      within(first('.user-star')) do
        expect(page).to have_content('ruby')
        expect(page).to have_content('rails')
        expect(page).to have_content('vim')
      end

      within(first('.user-star')) do
        click_link 'Remove tags'
      end

      expect(page).to have_current_path(edit_tags_path(repo.id))

      within('#rails-tag') do
        click_button 'Remove tag'
      end

      within('#vim-tag') do
        click_button 'Remove tag'
      end

      # click_link 'Go Home'
      visit user_root_path(user.nickname)

      within(first('.user-star')) do
        expect(page).to have_content('ruby')
        expect(page).not_to have_content('rails')
        expect(page).not_to have_content('vim')
      end
    end
  end
end
