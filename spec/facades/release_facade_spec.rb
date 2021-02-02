# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReleaseFacade, type: :facade do
  describe 'class methods' do
    describe '.fetch_latest_release(owner, repo)' do
      context 'when there is a latest release', :vcr do
        let(:release) do 
          ReleaseFacade.fetch_latest_release(
            owner: 'Homebrew',
            repo: 'brew',
            token: Rails.application.credentials.test[:github_api_token]
          )
        end

        it { expect(release).to be_a(Release) }

        it { expect(release.url).to be_a(String) }
        it { expect(release.tag_name).to be_a(String) }
        it { expect(release.created_at).to be_a(String) }
        it { expect(release.published_at).to be_a(String) }
        it { expect(release.body).to be_a(String) }
      end

      context 'when no release exists', :vcr do
        let(:release) do 
          ReleaseFacade.fetch_latest_release(
            owner: 'taphill',
            repo: 'graph_ql',
            token: Rails.application.credentials.test[:github_api_token]
          )
        end

        it { expect(release).to be_nil }
      end
    end
  end
end
