# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Release/Index', type: :feature do
  context 'when a latest release exists', :vcr do
    before do
      login_user
      visit release_index_path(owner: 'Homebrew', repo: 'brew')
    end

    it { expect(page).to have_link('Homebrew/brew') }
    it { expect(page).to have_link('View on GitHub') }
  end
end
