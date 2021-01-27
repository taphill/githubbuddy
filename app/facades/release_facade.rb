class ReleaseFacade
  def self.fetch_latest_release(owner:, repo:)
    json_data = GitRepoService.latest_release(owner: owner, repo: repo)

    return nil if json_data[:message] == 'Not Found'

    Release.new(json_data)
  end
end
