# frozen_string_literal: true

class SyncFacade
  def self.fetch_user_stars(user)
    json_data = GitRepoService.user_stars(user.nickname)

    json_data.each do |data|
      repo = find_or_create_repo(data)

      user_repo = UserRepo.new(user_id: user.id, repo_id: repo.id)
      user_repo.save
    end
  end

  def self.find_or_create_repo(data)
    Repo.find_or_create_by(github_id: data[:id]) do |repo|
      repo.name = data[:name]
      repo.owner = data[:owner][:login]
      repo.url = data[:html_url]
      repo.description = data[:description]
    end
  end
end
