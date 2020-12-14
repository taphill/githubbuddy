# frozen_string_literal: true

class UserFacade
  def self.user_stars(user_nickname)
    json = GitRepoService.user_stars(user_nickname)

    json.map do |star_data|
      UserStar.new(star_data)
    end
  end
end
