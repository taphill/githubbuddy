# frozen_string_literal: true

class SyncFacade
  def self.create_repo_records_for(user)
    json_data = GitRepoService.user_stars(user.nickname)

    json_data.each do |data|
      next if Repo.find_by(github_repo_id: data[id])

      repo = Repo.create(
        github_repo_id: data[:id],
        name: data[:name],
        owner: data[:owner][:login],
        url: data[:html_url],
        description: data[:description],
      )

      user_repo = UserRepo.new(user_id: user.id, repo_id: repo.id)
      user_repo.save
    end
  end
end
