class UserStarsFacade
  def self.user_stars(user_nickname)
    json = GitHubService.user_stars(user_nickname)

    json.map do |star_data|
      UserStar.new(star_data)
    end
  end
end
