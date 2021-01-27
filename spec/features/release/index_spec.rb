require 'rails_helper'

RSpec.describe 'Release/Index', type: :feature do
  context 'when a latest release exists', :vcr do
    before do
      visit release_index_path(owner: 'Homebrew', repo: 'brew')
    end

    it { expect(page).to have_content('Latest Release') }
  end
end
