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
      tag = create(:tag, name: 'ruby')
      create(:tagging, tag: tag, user_repo: user.user_repos[0])

      visit user_root_path(user.nickname)

      within(first('.user-star')) do
        click_link 'Remove tags'
      end

      expect(page).to have_current_path(edit_tags_path(repo.id))
    end

    it 'allows user to remove tags' do
      tag = create(:tag, name: 'ruby')
      create(:tagging, tag: tag, user_repo: user.user_repos[0])

      visit user_root_path(user.nickname)

      within(first('.user-star')) do
        expect(page).to have_content('ruby')
        click_link 'Remove tags'
      end

      within('#ruby-tag') do
        click_button 'Remove tag'
      end

      click_link 'Done'

      expect(Tagging.all).to eq([])
    end
  end
end
