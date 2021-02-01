require 'rails_helper'

RSpec.describe Release, type: :poro do
  describe 'attributes' do
    let(:attr) do
      {
        html_url: 'https://github.com/Homebrew/brew/releases/tag/2.7.6',
        tag_name: '2.7.6',
        created_at: '2021-01-27T08:55:10Z',
        published_at: '2021-01-27T11:34:04Z',
        body: "### Fixed\r\n\r\n- Very important fix"
      }
    end

    let(:release) { Release.new(attr) }

    it { expect(release).to be_a(Release) }
    it { expect(release.url).to eq('https://github.com/Homebrew/brew/releases/tag/2.7.6') }
    it { expect(release.tag_name).to eq('2.7.6') }
    it { expect(release.created_at).to eq('January 27, 2021') }
    it { expect(release.published_at).to eq('January 27, 2021') }
    it { expect(release.body).to eq("### Fixed\r\n\r\n- Very important fix") }
  end
end
