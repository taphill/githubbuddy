# frozen_string_literal: true

class UserFacade
  def self.user_stars(user_nickname)
    json = GitRepoService.user_stars(user_nickname)

    stars = json.map do |star_data|
      UserStar.new(star_data)
    end



    Repo.find_or_create_by(github_repo_id: ) do
      
    end
  end
end
