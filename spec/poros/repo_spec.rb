require 'rails_helper'

RSpec.describe Repo do
  let(:repo) { Repo.new(mock_repo_data) }

  it { expect(repo).to be_a Repo }
  it { expect(repo.name).to eq('travis.rb') }
  it { expect(repo.owner).to eq('travis-ci') }
  it { expect(repo.url).to eq('https://github.com/travis-ci/travis.rb') }
  it { expect(repo.description).to eq(mock_repo_data[:description]) }
  it { expect(repo.language).to eq('Ruby') }
  it { expect(repo.star_count).to eq(1525) }
  it { expect(repo.fork_count).to eq(415) }
end
