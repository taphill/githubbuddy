# frozen_string_literal: true

class UserFacade
  def self.user_stars(user)
    json = GitRepoService.user_stars(user.nickname)

    create_repo_records(user: user, json_data: json)
    create_repo_objects(json)
  end

  def self.create_repo_records(user:, json_data:)
    json_data.each do |star_data|
      repo = Repo.find_or_create_by(github_repo_id: star_data[:id])

      user_repo = UserRepo.new(user_id: user.id, repo_id: repo.id)
      user_repo.save
    end
  end

  def self.create_repo_objects(json)
    json.map do |star_data|
      UserStar.new(star_data)
    end
  end
end
